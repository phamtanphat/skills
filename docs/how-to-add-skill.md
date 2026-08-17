# Cách thêm Skill mới

## Bước 1 — Xác định Feature

| Nhóm / Ngôn ngữ | Thư mục |
|-----------------|---------|
| Dart / Flutter | `features/dart/skills/` |
| Swift / iOS | `features/swift/skills/` |
| JavaScript / TypeScript / React | `features/javascript/skills/` |
| Python / FastAPI | `features/python/skills/` |
| Workflow / Git / Code Review | `features/workflow/skills/` |
| UI/UX / Design | `features/design/skills/` |
| Kiến trúc / Structure | `features/structure/skills/` |
| Testing / QA | `features/testing/skills/` |
| Delivery / DevOps | `features/delivery/skills/` |

## Bước 2 — Tạo file markdown

```bash
# Ví dụ: Thêm skill Flutter Riverpod mới
touch features/dart/skills/flutter/my-riverpod-rules.md
```

## Bước 3 — Viết nội dung skill

```markdown
# [Tên skill] — Mô tả ngắn

## Mục tiêu
Giải thích skill này làm gì và khi nào dùng.

## Quy tắc chính
- Rule 1
- Rule 2

## Ví dụ
\`\`\`dart
// Code example
\`\`\`

## Checklist
- [ ] Item 1
- [ ] Item 2
```

## Bước 4 — Đăng ký trong apm.yml

```yaml
skills:
  - name: my-riverpod-rules         # tên unique, dùng kebab-case
    description: Quy chuẩn Riverpod
    path: ./features/dart/skills/flutter/my-riverpod-rules.md
    activate:
      include: ["**/*.dart"]       # Kích hoạt theo loại file
      # hoặc:
      # always: true             # Luôn kích hoạt
```

## Bước 5 — Kiểm tra

```bash
apm list
```
