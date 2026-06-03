# Fetch MCP — Web Content Fetcher
# Nguồn: github.com/modelcontextprotocol/servers (Official Reference Server)

# Cấu hình trong mcpServers:
# fetch:
#   command: uvx
#   args: ["mcp-server-fetch"]
#   transport: stdio

## Mô tả
Fetch web content và convert sang markdown/text để LLM đọc được.
Không cần JavaScript execution — phù hợp cho static content.

## Capabilities
- Fetch URL và convert HTML → Markdown
- Extract text content từ documentation sites
- Download và đọc nội dung file (PDF, JSON, CSV qua URL)
- robots.txt compliant

## Khi nào dùng
- Đọc documentation online khi cần
- Lấy nội dung từ API docs, blog posts
- Verify nội dung của URL trước khi reference

## Ví dụ prompt
```
"Đọc tài liệu Flutter navigation 2.0 tại docs.flutter.dev/..."
"Lấy danh sách changelog từ github.com/riverpod/releases"
```

## Lưu ý
- Không chạy JavaScript — không phù hợp cho SPA/React apps
- Dùng Playwright MCP nếu cần JavaScript
