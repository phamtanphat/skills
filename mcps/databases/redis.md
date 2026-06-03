# Redis MCP — Cache & Session Tool

# Cấu hình đầy đủ để dùng trong mcpServers:
# redis:
#   command: npx
#   args: ["-y", "mcp-redis"]
#   transport: stdio
#   env:
#     REDIS_URL: "redis://localhost:6379"

## Capabilities
- Get/Set keys
- Xem TTL và memory usage
- Debug cache issues

## Khi nào dùng
- Kiểm tra cache có data chưa
- Debug session problems
- Monitor cache hit rate
