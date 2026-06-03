# Design Patterns — Các mẫu thiết kế thường dùng

## Creational
- **Factory** — Tạo object mà không cần biết class cụ thể
- **Singleton** — Chỉ một instance trong app (dùng cẩn thận)
- **Builder** — Xây dựng object phức tạp từng bước

## Structural
- **Repository** — Tách data access khỏi business logic
- **Adapter** — Chuyển đổi interface không tương thích
- **Decorator** — Thêm behavior mà không sửa class gốc

## Behavioral
- **Observer** — Pub/Sub, reactive patterns
- **Strategy** — Thay đổi algorithm tại runtime
- **Command** — Đóng gói action thành object

## Anti-patterns cần tránh
- ❌ God Object — một class làm quá nhiều thứ
- ❌ Spaghetti Code — không có cấu trúc rõ ràng
- ❌ Premature Optimization — tối ưu khi chưa cần
- ❌ Copy-Paste Programming — duplicate logic
