# 🤖 AI Skills & MCP Config (APM)

> Bộ kỹ năng (Skills), quy chuẩn code chuẩn hóa (Mobile-First: Flutter, iOS, Android...) và tích hợp MCP servers cho AI Assistant (**Antigravity, Claude Code, Cursor, Windsurf, Codex, Copilot**).

---

## ⚡ Cài đặt nhanh (1 lệnh)

```bash
curl -fsSL https://raw.githubusercontent.com/phamtanphat/skills/main/install.sh | bash
```

> Script tự động clone repo về `~/Desktop/skills/` và cài đặt `apm` CLI vào PATH.

---

## 🚀 Cách sử dụng trong dự án

```bash
# 1. Di chuyển vào thư mục dự án
cd your-project/

# 2. Khởi tạo (tự động nhận diện công nghệ, tạo apm.yml, inject skills & gợi ý MCP)
apm init
```

**APM sẽ tự động tạo cấu trúc phù hợp cho từng IDE:**

| IDE / Trợ lý AI | File / Thư mục được tạo | Đặc điểm |
|---|---|---|
| **Antigravity (Google)** | `CLAUDE.md` | Inline toàn bộ nội dung skills |
| **Claude Code** | `CLAUDE.md` + `.claude/skills/*.md` | Sử dụng `@import` theo skill |
| **Cursor** | `.cursor/rules/*.mdc` + `.cursorrules` | Chuẩn `.mdc` mới & fallback |
| **OpenAI Codex** | `AGENTS.md` + `.codex/skills/*.md` | Chuẩn multi-agent |
| **Windsurf** | `.windsurfrules` + `.windsurf/rules/*.md` | Context rules |
| **GitHub Copilot** | `.github/copilot-instructions.md` | Workspace instructions |

---

## 📦 Lệnh CLI (`apm`)

```bash
apm init                 # Khởi tạo apm.yml, tự động inject và hiển thị MCP phù hợp
apm inject               # Inject skills vào tất cả IDE được nhận diện trong máy
apm inject --ide cursor  # Chỉ định inject cho một IDE cụ thể (antigravity, cursor, claude...)
apm list                 # Liệt kê tất cả skills có sẵn theo từng feature
apm status               # Xem trạng thái cấu hình & kết nối IDE trong dự án hiện tại
apm update               # Cập nhật repo skills mới nhất từ GitHub
apm help                 # Hướng dẫn chi tiết các lệnh
```

---

## 📁 Cấu trúc thư mục

```
skills/
├── apm                               ← CLI tool chính
├── apm.yml                           ← Global config (Skills + MCP servers)
├── install.sh                        ← Script cài đặt 1 lệnh
│
├── features/                         ← Tổ chức theo Domain / Ngôn ngữ (Mobile-First)
│   ├── dart/                         ← Flutter: Riverpod, BLoC, Clean Arch, Style Guide...
│   ├── swift/                        ← iOS: SwiftUI, UIKit, Architecture patterns
│   ├── javascript/                   ← React, TypeScript patterns
│   ├── python/                       ← FastAPI, PEP8, Logic patterns
│   ├── workflow/                     ← Git workflow, Code review process, Task management
│   │   ├── mcps/                     ← OpenSpec, Serena, Context7, GitHub, Git
│   │   └── prompts/                  ← senior-dev, code-reviewer
│   ├── design/                       ← UI/UX, Design System, Wireframes
│   │   └── mcps/                     ← UI UX Pro Max (118k ⭐), Stitch, Fetch
│   ├── structure/                    ← Kiến trúc & Hạ tầng hệ thống
│   │   ├── skills/                   ← Clean Architecture, Design Patterns, Microservices
│   │   ├── mcps/                     ← Supabase, Postgres, Redis, AWS, Vercel, GCP, Memory
│   │   └── prompts/                  ← architect
│   ├── testing/                      ← QA & Test Automation
│   │   ├── skills/                   ← Unit Test, Integration Test, E2E Test
│   │   └── mcps/                     ← Playwright
│   └── delivery/                     ← CI/CD, Container & Triển khai
│       ├── skills/                   ← Docker, Kubernetes, CI/CD Pipeline
│       └── mcps/                     ← Brave Search
│
├── templates/                        ← Templates mẫu cho dự án mới
│   ├── flutter-project/apm.yml
│   ├── python-project/apm.yml
│   └── fullstack-project/apm.yml
│
└── docs/                             ← Hướng dẫn mở rộng
    ├── feature-structure.md          ← Quy ước tổ chức feature folders
    ├── how-to-add-skill.md           ← Hướng dẫn thêm skill mới
    └── how-to-add-mcp.md             ← Hướng dẫn thêm MCP mới
```

---

## 🔌 Tích hợp MCP Servers

Khi chạy `apm init`, hệ thống sẽ gợi ý các công cụ MCP phù hợp với nhu cầu dự án:

- **Spec & Workflow**: `openspec` (spec-driven development & task tracking).
- **Code Intelligence**: `serena` (symbol search & refactor), `context7` (tra cứu docs chính xác).
- **Design Intelligence**: `ui-ux-pro-max` (79 visual styles & design token generator), `stitch` (tạo wireframe Google).
- **Database & Backend**: `supabase`, `postgres`, `redis`.
- **Testing & Search**: `playwright`, `brave-search`.

---

## ➕ Mở rộng & Tùy chỉnh

- Xem [Quy ước cấu trúc Feature](./docs/feature-structure.md)
- Xem [Hướng dẫn thêm Skill mới](./docs/how-to-add-skill.md)
- Xem [Hướng dẫn thêm MCP mới](./docs/how-to-add-mcp.md)
