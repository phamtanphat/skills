# Brave Search MCP — Real-time Web Search
# Nguồn: github.com/modelcontextprotocol/servers (Official)

# Cấu hình trong mcpServers:
# brave-search:
#   command: npx
#   args: ["-y", "@modelcontextprotocol/server-brave-search"]
#   transport: stdio
#   env:
#     BRAVE_API_KEY: "your-brave-api-key-here"

## Cách lấy API Key
# 1. Đăng ký tại: brave.com/search/api
# 2. Free tier: 2,000 queries/month
# 3. Paid: $5/1000 queries

## Capabilities
- Web search với kết quả real-time
- News search
- Image search
- Không track người dùng (privacy-focused)

## Khi nào dùng
- AI cần tìm kiếm thông tin mới nhất
- Verify thông tin từ nhiều nguồn
- Tìm documentation, package, ví dụ code
- Research về công nghệ mới

## Ví dụ prompt
```
"Tìm kiếm cách config Riverpod 3.0 với Flutter Web"
"Có MCP server nào cho Figma không?"
"Best practices cho Flutter testing 2025 mới nhất"
```

## So sánh với Context7
| | Brave Search | Context7 |
|--|-------------|---------|
| **Loại** | Web search | Library docs |
| **Realtime** | ✅ | ⚠️ (cached) |
| **Code examples** | Kết quả từ web | Docs chính thức |
| **Tốt cho** | Thông tin mới | API reference |
