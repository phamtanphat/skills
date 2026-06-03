# PostgreSQL MCP — Direct Database Access

# Cấu hình đầy đủ để dùng trong mcpServers:
# postgres:
#   command: npx
#   args: ["-y", "@modelcontextprotocol/server-postgres"]
#   transport: stdio
#   env:
#     DATABASE_URL: "postgresql://user:password@localhost:5432/mydb"

## Capabilities
- Chạy SQL queries trực tiếp
- Xem schema và table structure
- Explain query plans

## Khi nào dùng
- Debug slow queries
- Verify data integrity
- Tạo migration scripts
