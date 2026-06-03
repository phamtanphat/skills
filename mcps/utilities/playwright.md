# Playwright MCP — Browser Automation
# Nguồn: github.com/microsoft/playwright-mcp (Microsoft Official)

# Cấu hình trong mcpServers:
# playwright:
#   command: npx
#   args: ["-y", "@playwright/mcp@latest"]
#   transport: stdio

## Mô tả
Browser automation và testing tool từ Microsoft.
AI có thể điều khiển browser thực, chụp screenshot, tương tác với web app.

## Capabilities
- Điều hướng URL, click, fill form
- Chụp screenshots và full-page captures
- Execute JavaScript trong browser context
- Network request interception
- Multi-tab management
- Mobile viewport emulation

## Khi nào dùng
- E2E testing tự động
- Kiểm tra UI sau khi deploy
- Scraping dữ liệu từ web
- Debug web app issues
- Generate test scripts từ user actions

## Ví dụ prompt
```
"Mở localhost:3000 và chụp screenshot trang login"
"Test flow: đăng nhập → tạo sản phẩm → verify trong danh sách"
"Kiểm tra xem trang có responsive trên mobile 375px không"
```

## Lưu ý
- Cần cài Playwright browsers: `npx playwright install`
- Headless mode mặc định (không hiện cửa sổ)
- Dùng `--headed` flag để xem browser thực
