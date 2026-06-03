# AI Skills & MCP Config System

Hệ thống quản lý skills và MCP servers cho AI assistant.

## Cấu trúc thư mục

```
skills/
├── apm.yml                    ← Entry point chính
├── skills/                    ← Hướng dẫn cho AI
│   ├── languages/             ← Theo ngôn ngữ lập trình
│   │   ├── dart/
│   │   ├── python/
│   │   ├── javascript/
│   │   └── swift/
│   ├── workflow/              ← Quy trình làm việc
│   ├── architecture/          ← Kiến trúc phần mềm
│   ├── testing/               ← Kiểm thử
│   └── devops/                ← DevOps & CI/CD
├── mcps/                      ← MCP server configs
│   ├── code-tools/
│   ├── databases/
│   ├── cloud/
│   └── utilities/
├── prompts/                   ← AI personas
├── templates/                 ← Template cho dự án mới
│   ├── flutter-project/
│   ├── python-project/
│   └── fullstack-project/
└── docs/                      ← Tài liệu hệ thống
```

## Bắt đầu dự án mới

```bash
# 1. Copy template phù hợp vào dự án
cp ~/Desktop/skills/templates/flutter-project/apm.yml ./apm.yml

# 2. Chỉnh sửa name và thêm skills/MCPs cần thiết
nano apm.yml
```

## Thêm skill mới

1. Tạo file `.md` trong thư mục phù hợp trong `skills/`
2. Thêm entry vào `apm.yml` trong section `skills:`

## Thêm MCP mới

1. Tạo file documentation `.md` trong thư mục phù hợp trong `mcps/`
2. Thêm entry vào `apm.yml` trong section `mcpServers:`

## Tài liệu thêm

- [Cách thêm skill mới](./how-to-add-skill.md)
- [Cách thêm MCP mới](./how-to-add-mcp.md)
