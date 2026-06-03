# 🤖 AI Skills & MCP Config

> Bộ skills, quy chuẩn code và MCP servers cho AI assistant (Claude, Cursor, Codex, Windsurf, Copilot...)

## ⚡ Cài đặt nhanh (1 lệnh)

```bash
curl -fsSL https://raw.githubusercontent.com/phamtanphat/skills/main/install.sh | bash
```

> Script sẽ tự động clone repo về `~/Desktop/skills/` và cài `apm` CLI vào PATH.

---

## 🚀 Dùng trong dự án

```bash
# 1. Vào thư mục dự án
cd your-project/

# 2. Khởi tạo (tự detect loại project: flutter, python, react...)
apm init

# 3. Inject skills vào tất cả IDE đang dùng
apm inject
```

**Đó thôi.** APM sẽ tạo các file config phù hợp cho từng IDE:

| File được tạo | IDE |
|---|---|
| `CLAUDE.md` | Claude / Antigravity |
| `.cursorrules` | Cursor |
| `codex.md` | OpenAI Codex |
| `.windsurfrules` | Windsurf / Codeium |
| `.github/copilot-instructions.md` | GitHub Copilot / VSCode |

---

## 📦 APM Commands

```bash
apm init              # Tạo apm.yml cho dự án (auto-detect project type)
apm inject            # Inject skills vào tất cả IDE được detect
apm inject --ide cursor  # Inject vào IDE cụ thể
apm update            # Cập nhật skills repo từ GitHub
apm status            # Xem trạng thái dự án
apm list              # Liệt kê tất cả skills có sẵn
```

---

## 📁 Cấu trúc

```
skills/
├── install.sh              ← Script cài đặt 1 lệnh
├── apm                     ← CLI tool
├── apm.yml                 ← Global config (skills + MCPs)
│
├── skills/                 ← Nội dung skills (markdown)
│   ├── languages/          ← Dart/Flutter, Python, JavaScript
│   ├── architecture/       ← Clean Architecture, Design Patterns
│   ├── testing/            ← Unit Test, E2E
│   ├── devops/             ← Docker, CI/CD
│   └── workflow/           ← Git workflow, Code review
│
├── mcps/                   ← Docs cho từng MCP server
│   ├── code-tools/         ← Serena, Context7, GitHub
│   ├── databases/          ← Supabase, PostgreSQL, Redis
│   ├── cloud/              ← AWS, Vercel
│   └── utilities/          ← Stitch, Playwright, Fetch
│
├── templates/              ← Template apm.yml theo loại project
│   ├── flutter-project/
│   ├── python-project/
│   └── fullstack-project/
│
└── docs/                   ← Hướng dẫn thêm skill/MCP mới
```

---

## 🔧 Cập nhật skills

```bash
# Cập nhật repo
apm update

# Re-inject vào dự án
apm inject
```

## ➕ Thêm skill mới

Xem [docs/how-to-add-skill.md](./docs/how-to-add-skill.md)

## ➕ Thêm MCP mới

Xem [docs/how-to-add-mcp.md](./docs/how-to-add-mcp.md)
