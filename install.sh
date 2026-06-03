#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════════
# APM Install Script — github.com/phamtanphat/skills
# Cách dùng:
#   curl -fsSL https://raw.githubusercontent.com/phamtanphat/skills/main/install.sh | bash
# ═══════════════════════════════════════════════════════════════

set -euo pipefail

# ─── Colors ───────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# ─── Config ───────────────────────────────────────────────────
SKILLS_REPO="https://github.com/phamtanphat/skills.git"
SKILLS_DIR="${SKILLS_DIR:-$HOME/Desktop/skills}"
APM_BIN="$SKILLS_DIR/bin/apm"

# ─── Helpers ──────────────────────────────────────────────────
info()    { echo -e "${BLUE}ℹ${RESET}  $*"; }
success() { echo -e "${GREEN}✓${RESET}  $*"; }
warn()    { echo -e "${YELLOW}⚠${RESET}  $*"; }
error()   { echo -e "${RED}✗${RESET}  $*" >&2; }
header()  { echo -e "\n${BOLD}${CYAN}$*${RESET}"; }

# ═══════════════════════════════════════════════════════════════
header "APM — AI Package Manager"
echo -e "   ${CYAN}github.com/phamtanphat/skills${RESET}\n"
# ═══════════════════════════════════════════════════════════════

# ─── Step 1: Clone hoặc update repo ──────────────────────────
header "1/3  Cài đặt Skills Repository"

if [ -d "$SKILLS_DIR/.git" ]; then
  info "Repo đã có tại $SKILLS_DIR — đang cập nhật..."
  git -C "$SKILLS_DIR" pull --ff-only origin main 2>/dev/null && \
    success "Đã cập nhật lên phiên bản mới nhất" || \
    warn "Không thể pull (có thể đang offline hoặc có local changes)"
else
  info "Đang clone repo về $SKILLS_DIR..."
  git clone --depth=1 "$SKILLS_REPO" "$SKILLS_DIR"
  success "Clone thành công"
fi

# ─── Step 2: Cài apm vào PATH ─────────────────────────────────
header "2/3  Cài đặt APM CLI"

# Tạo bin dir nếu chưa có
mkdir -p "$SKILLS_DIR/bin"

# Copy apm CLI script vào bin/
cp "$SKILLS_DIR/apm" "$APM_BIN" 2>/dev/null || true
chmod +x "$APM_BIN"

# Detect shell và add to PATH
SHELL_RC=""
if [ -n "${ZSH_VERSION:-}" ] || [ "$(basename "$SHELL")" = "zsh" ]; then
  SHELL_RC="$HOME/.zshrc"
elif [ -n "${BASH_VERSION:-}" ] || [ "$(basename "$SHELL")" = "bash" ]; then
  SHELL_RC="$HOME/.bashrc"
  [ -f "$HOME/.bash_profile" ] && SHELL_RC="$HOME/.bash_profile"
fi

APM_PATH_LINE="export PATH=\"\$PATH:$SKILLS_DIR/bin\""
if [ -n "$SHELL_RC" ] && ! grep -q "skills/bin" "$SHELL_RC" 2>/dev/null; then
  echo "" >> "$SHELL_RC"
  echo "# APM — AI Package Manager" >> "$SHELL_RC"
  echo "$APM_PATH_LINE" >> "$SHELL_RC"
  success "Đã thêm APM vào PATH ($SHELL_RC)"
else
  success "APM đã có trong PATH"
fi

# Cũng add vào session hiện tại
export PATH="$PATH:$SKILLS_DIR/bin"

# ─── Step 3: Check dependencies ───────────────────────────────
header "3/3  Kiểm tra Dependencies"

check_dep() {
  if command -v "$1" &>/dev/null; then
    success "$1 — $(command -v "$1")"
  else
    warn "$1 chưa cài — một số MCP có thể không hoạt động"
    echo "     → Cài đặt: $2"
  fi
}

check_dep "node"  "https://nodejs.org"
check_dep "npx"   "npm install -g npx"
check_dep "uvx"   "pip install uv  →  uv tool install uvx"
check_dep "git"   "https://git-scm.com"

# ─── Done ─────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}${BOLD}║   ✅  APM đã cài đặt thành công!        ║${RESET}"
echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════╝${RESET}"
echo ""
echo -e "  ${BOLD}Dùng APM trong dự án của bạn:${RESET}"
echo ""
echo -e "  ${CYAN}cd your-project/${RESET}"
echo -e "  ${CYAN}apm init${RESET}          # Khởi tạo cho dự án (tự detect loại project)"
echo -e "  ${CYAN}apm inject${RESET}        # Inject skills vào IDE (Claude, Cursor, Codex...)"
echo -e "  ${CYAN}apm status${RESET}        # Xem trạng thái hiện tại"
echo ""
echo -e "  ${YELLOW}Lưu ý: Mở terminal mới hoặc chạy:${RESET}"
echo -e "  ${CYAN}source ${SHELL_RC:-~/.zshrc}${RESET}"
echo ""
