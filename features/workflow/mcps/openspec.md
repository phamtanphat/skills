# OpenSpec MCP — Spec-Driven Development

> **OpenSpec** — Framework phát triển phần mềm theo đặc tả (Spec-Driven Development - SDD), giúp AI assistant bám sát requirements, proposals, tasks và thiết kế kiến trúc trước khi sinh code.
> Website: https://openspec.pro | GitHub: https://github.com/fission-ai/openspec

---

## 🎯 Mục đích & Lợi ích

- **Spec-Driven AI Coding**: Buộc AI phải đọc, hiểu và tuân thủ specification trước khi thay đổi codebase.
- **Task Tracking & Approval Workflow**: Theo dõi tiến độ task theo thời gian thực và quản lý phê duyệt thay đổi.
- **Interactive Dashboard**: Tùy chọn mở web dashboard trực quan hóa specs, proposals và tiến độ dự án.
- **Giảm Hallucination & Code Drift**: Ngăn chặn AI tự ý suy đoán kiến trúc hoặc viết code lệch khỏi yêu cầu ban đầu.

---

## ⚙️ Cấu hình MCP (trong `apm.yml`)

### 1. Cấu hình tiêu chuẩn (Standard)
```yaml
mcpServers:
  openspec:
    command: npx
    args: ["-y", "openspec-mcp"]
    transport: stdio
```

### 2. Cấu hình kèm Web Dashboard
```yaml
mcpServers:
  openspec:
    command: npx
    args: ["-y", "openspec-mcp", "--with-dashboard"]
    transport: stdio
```

---

## 🚀 Cài đặt CLI bổ trợ (Tùy chọn)

Để dùng toàn bộ tính năng của OpenSpec CLI trong terminal:

```bash
# Cài đặt OpenSpec core CLI
npm install -g @fission-ai/openspec

# Hoặc cài global MCP server
npm install -g openspec-mcp
```

---

## 💡 Ví dụ sử dụng với AI Assistant

```markdown
# 1. Khởi tạo spec cho tính năng mới
"Dùng OpenSpec tạo proposal cho tính năng User Authentication với Firebase và Riverpod."

# 2. Review và duyệt task
"Kiểm tra OpenSpec tasks hiện tại của sprint này và liệt kê các việc cần làm."

# 3. Thực thi code bám sát spec
"Triển khai code cho task AUTH-01 theo đúng OpenSpec specification đã duyệt."
```

---

## 🛠️ Capabilities

- `read_spec`: Đọc nội dung file đặc tả / requirements.
- `list_tasks`: Liệt kê danh sách tasks và trạng thái.
- `update_task_status`: Cập nhật tiến độ task (pending, in_progress, completed).
- `create_proposal`: Tạo bản đề xuất thay đổi kiến trúc hoặc tính năng mới.
