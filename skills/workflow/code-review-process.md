# Code Review Process — Quy trình review

## Reviewer phải kiểm tra
1. **Correctness** — Code có làm đúng yêu cầu không?
2. **Security** — Có lỗ hổng bảo mật không?
3. **Performance** — Có query N+1, memory leak không?
4. **Maintainability** — Code có dễ hiểu, dễ sửa không?
5. **Tests** — Có test coverage đủ không?

## Cách đưa feedback
```
# ✅ Constructive feedback
"Có thể dùng `map()` ở đây để ngắn gọn hơn:
`users.map(u => u.name)`"

# ❌ Vague feedback  
"Code này xấu, viết lại đi"
```

## Label cho comments
- `[blocking]` — Phải sửa trước khi merge
- `[suggestion]` — Nên sửa nhưng không bắt buộc
- `[question]` — Cần giải thích thêm
- `[nitpick]` — Nhỏ nhặt, tùy author quyết định

## Thời gian
- Reviewer phải respond trong **24 giờ**
- Author phải address comments trong **48 giờ**
