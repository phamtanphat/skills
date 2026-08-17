# Riverpod Patterns — Các mẫu thiết kế chuẩn

## Provider Types
- `Provider` — Giá trị không đổi
- `FutureProvider` — Async một lần
- `StreamProvider` — Async liên tục
- `NotifierProvider` — State có thể thay đổi
- `AsyncNotifierProvider` — State async có thể thay đổi

## Ví dụ chuẩn

```dart
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() => const AuthState.initial();

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    try {
      final user = await ref.read(authRepositoryProvider).login(email, password);
      state = AuthState.authenticated(user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }
}
```

## Antipatterns cần tránh
- ❌ Gọi `ref.watch()` trong callback/event handler
- ❌ Tạo provider trong widget
- ❌ Sử dụng `context` trong provider
