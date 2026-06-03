# Unit Test Guide — Hướng dẫn viết unit test

## Nguyên tắc F.I.R.S.T
- **Fast** — Test phải chạy nhanh (< 1ms mỗi test)
- **Independent** — Tests không phụ thuộc nhau
- **Repeatable** — Kết quả luôn như nhau trong mọi môi trường
- **Self-validating** — Pass hoặc Fail, không có "maybe"
- **Timely** — Viết test cùng lúc với code (TDD)

## AAA Pattern
```dart
// Flutter/Dart example
test('should return user when id is valid', () {
  // Arrange
  final repo = MockUserRepository();
  when(repo.findById('123')).thenReturn(User(id: '123', name: 'Test'));
  
  // Act
  final result = userService.getUser('123');
  
  // Assert
  expect(result.name, equals('Test'));
});
```

## Naming Convention
```
test('should <expected> when <condition>', () {...})
test('returns null when user not found', () {...})
test('throws InvalidEmailError when email is empty', () {...})
```

## Coverage Target
- Minimum: **80%** coverage
- Business logic (services, use cases): **95%+**
- UI widgets: **60%+** (integration test bổ sung)
- Utility functions: **100%**

## Mocks vs Stubs vs Fakes
- **Mock** — Verify interaction (đã gọi hàm chưa?)
- **Stub** — Trả về giá trị cố định
- **Fake** — Implementation đơn giản hóa (in-memory DB)
