# GitHub MCP — Repository & Code Management
# Nguồn: github.com/modelcontextprotocol/servers (Official)

# Cấu hình trong mcpServers:
# github:
#   command: npx
#   args: ["-y", "@modelcontextprotocol/server-github"]
#   transport: stdio
#   env:
#     GITHUB_PERSONAL_ACCESS_TOKEN: "ghp_your_token_here"

## Cách tạo Personal Access Token
# 1. Vào github.com → Settings → Developer settings
# 2. Personal access tokens → Tokens (classic) → Generate new token
# Permissions cần: repo, read:org, read:user

## Capabilities
- Search repositories, code, issues, PRs
- Create/update issues và pull requests
- Read file contents từ repository
- List branches, commits, releases
- Create gists
- Manage GitHub Actions workflows

## Khi nào dùng
- Review code trên GitHub từ AI
- Tạo issue/PR template tự động
- Search codebase patterns trên toàn bộ org
- Tự động tạo release notes từ commits
- Kiểm tra CI/CD status

## Ví dụ prompt
```
"Tìm tất cả files có dùng deprecated API trong repo my-project"
"Tạo PR description cho branch feature/auth-refresh"
"List tất cả open issues có label 'bug' trong 7 ngày qua"
```
