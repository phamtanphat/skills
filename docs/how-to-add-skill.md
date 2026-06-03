# Cách thêm Skill mới

## Bước 1 — Xác định loại skill

| Loại skill | Thư mục |
|-----------|---------|
| Ngôn ngữ lập trình | `skills/languages/<tên-ngôn-ngữ>/` |
| Quy trình làm việc | `skills/workflow/` |
| Kiến trúc | `skills/architecture/` |
| Testing | `skills/testing/` |
| DevOps | `skills/devops/` |

## Bước 2 — Tạo file markdown

```bash
# Ví dụ: Thêm skill Go language
touch skills/languages/go/code-review.md
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
\`\`\`go
// Code example
\`\`\`

## Checklist
- [ ] Item 1
- [ ] Item 2
```

## Bước 4 — Đăng ký trong apm.yml

```yaml
skills:
  - name: go-code-review         # tên unique, dùng kebab-case
    description: Quy chuẩn Go
    path: ./skills/languages/go/code-review.md
    activate:
      include: ["**/*.go"]       # Kích hoạt theo loại file
      # hoặc:
      # always: true             # Luôn kích hoạt
```
