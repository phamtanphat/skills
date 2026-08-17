# Filesystem MCP — File System Access
# Nguồn: github.com/modelcontextprotocol/servers (Official Reference Server)

# Cấu hình trong mcpServers:
# filesystem:
#   command: npx
#   args:
#     - "-y"
#     - "@modelcontextprotocol/server-filesystem"
#     - "/Users/your-username/projects"   # ← Thư mục được phép truy cập
#   transport: stdio

## Capabilities
- Đọc/ghi files trong thư mục được cho phép
- List directory contents
- Search files theo pattern
- Create, move, delete files
- Configurable access controls (chỉ cho phép đọc hoặc cả đọc/ghi)

## Khi nào dùng
- AI cần đọc nhiều files trong project cùng lúc
- Tự động refactor nhiều files
- Tạo/generate code files hàng loạt
- Search pattern trên toàn bộ codebase

## Bảo mật
- Chỉ cấp quyền truy cập thư mục cần thiết
- Không cấp quyền root `/` hoặc home `~`
- Dùng read-only mode khi không cần ghi

## Ví dụ prompt
```
"Đọc tất cả file .dart trong features/auth/ và tổng hợp logic"
"Tạo barrel file index.dart cho thư mục widgets/"
```
