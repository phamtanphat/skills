# Feature Structure Convention

> Convention cho việc tổ chức skills, MCPs và prompts theo feature trong project này.

---

## Tại sao dùng Feature Folders?

Project **AI Skills** hướng tới Mobile (Android/iOS). Thay vì tổ chức theo *loại file* (`skills/`, `mcps/`), chúng ta tổ chức theo *tính năng* — giúp:

- Dễ tìm: mọi thứ liên quan đến testing ở `features/testing/`
- Dễ mở rộng: thêm feature mới mà không ảnh hưởng feature khác
- Rõ ràng hơn: mỗi feature tự chứa đủ skills + MCPs + prompts

---

## Các Features hiện có

| Feature | Mục đích | Nội dung |
|---|---|---|
| `coding/` | Viết & review code | Dart/Flutter, Swift/iOS, JS, Python, Git workflow |
| `design/` | UI/UX & wireframe | Stitch, design reference |
| `structure/` | Kiến trúc & hạ tầng | Clean Arch, databases, cloud |
| `testing/` | QA & automation | Unit test, integration, E2E, Playwright |
| `delivery/` | CI/CD & deployment | Docker, K8s, CI/CD pipeline, App Store |

---

## Cấu trúc mỗi Feature

```
features/<feature-name>/
├── skills/         ← Markdown files hướng dẫn AI (được inject vào IDE)
├── mcps/           ← Docs mô tả cách dùng từng MCP server
└── prompts/        ← System prompts / persona cho AI
```

### `skills/`
- Format: Markdown (`.md`)
- Nội dung: quy chuẩn code, hướng dẫn, patterns cho AI đọc
- Được đăng ký trong `apm.yml` với `activate` conditions
- Được inject vào IDE qua `apm inject`

### `mcps/`
- Format: Markdown (`.md`) — chỉ là **documentation**, không phải config
- Nội dung: mô tả MCP server làm gì, cách cài, ví dụ dùng
- Config thực tế nằm trong `apm.yml` > `mcpServers`

### `prompts/`
- Format: Markdown (`.md`)
- Nội dung: system prompt, persona cho AI assistant
- Dùng thủ công hoặc qua `apm inject --prompt`

---

## Thêm Skill mới

1. **Chọn feature** phù hợp (`coding`, `design`, `structure`, `testing`, `delivery`)
2. **Tạo file** trong `features/<feature>/skills/<category>/<skill-name>.md`
3. **Đăng ký** trong `apm.yml`:

```yaml
skills:
  - name: my-new-skill
    description: Mô tả ngắn
    path: ./features/<feature>/skills/<category>/<skill-name>.md
    activate:
      always: true        # luôn inject
      # hoặc:
      include: ["**/*.dart"]  # chỉ inject khi match pattern
```

4. **Test** với `apm list` (thấy skill mới) và `apm inject` (inject thành công)

---

## Thêm MCP mới

1. **Chọn feature** phù hợp
2. **Tạo doc** `features/<feature>/mcps/<mcp-name>.md` mô tả MCP
3. **Thêm config** vào `apm.yml` > `mcpServers` với comment `# Docs: ./features/<feature>/mcps/<mcp-name>.md`

---

## Thêm Feature mới

Khi cần thêm một domain mới (ví dụ: `ai/`, `data/`, `mobile/`):

```bash
mkdir -p features/my-feature/skills
mkdir -p features/my-feature/mcps
mkdir -p features/my-feature/prompts
```

Sau đó thêm skills/MCPs tương ứng và đăng ký trong `apm.yml`.

---

## Xem tất cả skills theo feature

```bash
apm list
```

Output sẽ group theo feature:
```
[coding]  (25 skills)
  • dart/flutter/flutter-code-review.md
  • ...

[design]  (2 skills)
  • ...
```
