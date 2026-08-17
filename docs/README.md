# AI Skills & MCP Config System

Hệ thống quản lý skills và MCP servers cho AI assistant (Mobile-first).

## Cấu trúc thư mục

```
skills/
├── apm                        ← CLI tool chính
├── apm.yml                    ← Entry point & Global config
├── install.sh                 ← Script cài đặt 1 lệnh
├── features/                  ← Tổ chức theo từng feature
│   ├── dart/                  ← Flutter & Dart rules
│   ├── swift/                 ← iOS & SwiftUI rules
│   ├── javascript/            ← React & TypeScript rules
│   ├── python/                ← Python & FastAPI rules
│   ├── workflow/              ← Git, Code review, Task management
│   ├── design/                ← UI/UX, Stitch, UI UX Pro Max
│   ├── structure/             ← Architecture, Databases, Cloud
│   ├── testing/               ← Unit test, Integration, E2E
│   └── delivery/              ← CI/CD, Docker, Kubernetes
├── templates/                 ← Template cho dự án mới
│   ├── flutter-project/
│   ├── python-project/
│   └── fullstack-project/
└── docs/                      ← Tài liệu hệ thống
    ├── feature-structure.md   ← Convention feature folders
    ├── how-to-add-skill.md    ← Cách thêm skill mới
    └── how-to-add-mcp.md      ← Cách thêm MCP mới
```

## Bắt đầu dự án mới

```bash
# 1. Vào thư mục dự án
cd your-project/

# 2. Khởi tạo & tự động inject
apm init
```

## Tài liệu chi tiết

- [Feature Structure Convention](./feature-structure.md)
- [Cách thêm skill mới](./how-to-add-skill.md)
- [Cách thêm MCP mới](./how-to-add-mcp.md)
