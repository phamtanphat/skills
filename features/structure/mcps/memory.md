# Memory MCP — Persistent AI Memory
# Nguồn: github.com/modelcontextprotocol/servers (Official Reference Server)

# Cấu hình trong mcpServers:
# memory:
#   command: npx
#   args: ["-y", "@modelcontextprotocol/server-memory"]
#   transport: stdio

## Mô tả
Knowledge graph-based persistent memory system.
AI có thể nhớ thông tin qua nhiều sessions khác nhau.

## Capabilities
- **Entities** — Lưu trữ thực thể (người, dự án, khái niệm)
- **Relations** — Quan hệ giữa các entities
- **Observations** — Ghi chú/facts về entities
- Persistent across sessions — Nhớ qua nhiều cuộc hội thoại

## Khi nào dùng
- Lưu quyết định kiến trúc (Architecture Decision Records)
- Nhớ context của dự án lâu dài
- Track TODO items và technical debt
- Nhớ preferences của team về coding style

## Ví dụ prompt
```
"Nhớ rằng dự án này dùng Clean Architecture với Riverpod"
"Lưu lại: Team quyết định dùng Supabase thay vì Firebase vì lý do X"
"Nhắc lại những quyết định kiến trúc quan trọng của dự án này"
```

## Lưu ý
- Data được lưu locally trong file JSON
- Không sync cloud — mỗi machine có memory riêng
