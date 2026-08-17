# E2E Test — End-to-End Testing

## Khi nào dùng E2E Test
- Test toàn bộ user journey từ UI đến DB
- Verify critical paths (login, checkout, payment)
- Smoke test sau khi deploy

## Tools
| Platform | Tool |
|----------|------|
| Web | Playwright, Cypress |
| Flutter | `integration_test` + `flutter drive` |
| Mobile | Appium, Detox |

## Playwright Example
```typescript
test('user can login and view dashboard', async ({ page }) => {
  await page.goto('/login');
  await page.fill('[data-testid="email"]', 'user@example.com');
  await page.fill('[data-testid="password"]', 'password123');
  await page.click('[data-testid="login-btn"]');
  
  await expect(page).toHaveURL('/dashboard');
  await expect(page.locator('h1')).toHaveText('Welcome back!');
});
```

## Best Practices
- Dùng `data-testid` attributes, không dùng CSS class
- Chạy E2E test trên staging, không phải local
- Chỉ test critical paths (không test mọi thứ)
- Parallel execution để giảm thời gian chạy

## Checklist
- [ ] Login/logout flow
- [ ] Core business flow (tùy app)
- [ ] Error states (network error, invalid input)
- [ ] Mobile responsive (nếu web)
