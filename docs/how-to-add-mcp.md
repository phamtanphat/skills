# Cách thêm MCP Server mới

## Bước 1 — Tìm MCP package

Tìm MCP servers tại:
- https://github.com/modelcontextprotocol/servers
- https://glama.ai/mcp/servers
- npm: `npm search @modelcontextprotocol`

## Bước 2 — Xác định loại MCP

| Loại | Thư mục |
|------|---------|
| Code tools | `mcps/code-tools/` |
| Databases | `mcps/databases/` |
| Cloud | `mcps/cloud/` |
| Tiện ích khác | `mcps/utilities/` |

## Bước 3 — Tạo file documentation

```bash
# Ví dụ: Thêm MongoDB MCP
touch mcps/databases/mongodb.md
```

Nội dung file:
```markdown
# MongoDB MCP — Database Access

# Cấu hình:
# mongodb:
#   command: npx
#   args: ["-y", "@mongodb/mcp-server"]
#   transport: stdio
#   env:
#     MONGODB_URI: "mongodb://localhost:27017"

## Capabilities
- Query documents
- Manage collections
- View indexes

## Khi nào dùng
- Debug queries
- Inspect data
```

## Bước 4 — Thêm vào apm.yml

```yaml
mcpServers:
  mongodb:
    command: npx
    args: ["-y", "@mongodb/mcp-server"]
    transport: stdio
    env:
      MONGODB_URI: "mongodb://localhost:27017"
```

## Kiểm tra transport type

| Transport | Khi nào dùng |
|-----------|-------------|
| `stdio` | Hầu hết MCP servers (command-line) |
| `serverUrl` | HTTP-based MCP servers (như Stitch) |
