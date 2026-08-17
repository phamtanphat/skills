# Git MCP — Git Repository Operations
# Nguồn: github.com/modelcontextprotocol/servers (Official Reference Server)

# Cấu hình trong mcpServers:
# git:
#   command: uvx
#   args: ["mcp-server-git", "--repository", "/path/to/your/project"]
#   transport: stdio

## Capabilities
- `git_status` — Xem trạng thái working tree
- `git_diff` — Xem thay đổi unstaged/staged
- `git_log` — Lịch sử commit
- `git_show` — Xem nội dung commit cụ thể
- `git_branch` — List branches
- `git_add` / `git_commit` — Stage và commit
- `git_checkout` — Chuyển branch
- `git_create_branch` — Tạo branch mới

## Khi nào dùng
- AI tự động commit code sau khi generate
- Review diff trước khi commit
- Tạo conventional commit message từ diff
- Tóm tắt changes trong sprint

## Ví dụ prompt
```
"Xem diff của tất cả thay đổi và viết commit message theo Conventional Commits"
"Tóm tắt những gì đã thay đổi trong 5 commits gần nhất"
"Tạo CHANGELOG.md từ git log giữa v1.0.0 và HEAD"
```
