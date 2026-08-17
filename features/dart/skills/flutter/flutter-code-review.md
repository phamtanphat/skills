# Flutter Code Review — Quy chuẩn Dart & Flutter (2025)
# Nguồn: Riverpod 2.0+ official docs, Flutter team guidelines, pub.dev best practices

## Mục tiêu
Đảm bảo code Flutter tuân thủ chuẩn Riverpod Generator, Clean Architecture và Dart style guide cập nhật 2025.

## 1. Kiến trúc & Cấu trúc (Feature-First)

### Tổ chức thư mục
```
lib/
├── features/
│   ├── auth/
│   │   ├── data/          # Repository implementations, DTOs
│   │   ├── domain/        # Entities, Repository interfaces
│   │   └── presentation/  # Pages, Widgets, Providers
│   └── profile/
│       ├── data/
│       ├── domain/
│       └── presentation/
├── core/
│   ├── error/             # Failures, Exceptions
│   ├── network/           # HTTP client, interceptors
│   └── utils/
└── main.dart
```

> ✅ **Feature-First** (nhóm theo feature) được khuyến nghị hơn **Layer-First** (nhóm theo layer)

## 2. State Management — Riverpod Generator (bắt buộc)

### Luôn dùng `@riverpod` annotation
```dart
// ✅ ĐÚNG — dùng riverpod_generator
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() => const AuthState.initial();

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    try {
      final user = await ref.read(authRepositoryProvider).login(email, password);
      state = AuthState.authenticated(user);
    } catch (e, st) {
      state = AuthState.error(e.toString());
    }
  }
}

// ❌ SAI — khai báo provider thủ công
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(...);
```

### `.autoDispose` — mặc định bật
```dart
// ✅ autoDispose giúp giải phóng bộ nhớ khi không còn dùng
@riverpod
Future<List<Product>> products(ProductsRef ref) async {
  return ref.read(productRepositoryProvider).getAll();
}
// riverpod_generator tự động thêm .autoDispose
```

## 3. Performance — Tối ưu Widget Rebuild

```dart
// ✅ ĐÚNG — chỉ watch phần cần thiết
class UserNameText extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Chỉ rebuild khi name thay đổi, không rebuild khi avatar thay đổi
    final name = ref.watch(userProvider.select((u) => u.name));
    return Text(name);
  }
}

// ❌ SAI — watch toàn bộ object, rebuild không cần thiết
final user = ref.watch(userProvider); // rebuild khi BẤT KỲ field nào thay đổi
```

## 4. Xử lý AsyncValue (bắt buộc)

```dart
// ✅ ĐÚNG — xử lý đủ 3 states
ref.watch(productsProvider).when(
  data: (products) => ProductList(products: products),
  loading: () => const CircularProgressIndicator(),
  error: (err, stack) => ErrorView(message: err.toString()),
);

// ❌ SAI — force unwrap nguy hiểm
final products = ref.watch(productsProvider).value!;
```

## 5. Anti-patterns cần Flag trong Review

| Anti-pattern | Vấn đề | Giải pháp |
|-------------|--------|-----------|
| `ref.read()` trong build() | Không reactive | Dùng `ref.watch()` |
| Logic trong `build()` | Khó test, rebuild chậm | Tách vào Notifier/Service |
| `ref.read(provider).init()` trong initState | Provider phụ thuộc vào widget lifecycle | Provider tự khởi tạo trong `build()` |
| `StatefulWidget` cho shared state | Không scale | Dùng Riverpod provider |
| Dùng Riverpod cho local UI state | Overkill | Dùng `StatefulWidget` hoặc `flutter_hooks` |

## 6. Tooling bắt buộc

```yaml
# pubspec.yaml
dependencies:
  flutter_riverpod: ^2.5.0
  riverpod_annotation: ^2.3.0

dev_dependencies:
  riverpod_generator: ^2.4.0
  riverpod_lint: ^2.3.0   # ← BẮT BUỘC — lint tự động phát hiện lỗi
  build_runner: ^2.4.0
  custom_lint: ^0.6.0
```

```yaml
# analysis_options.yaml
analyzer:
  plugins:
    - custom_lint
```

## 7. Naming Convention (Dart 3.x)

| Loại | Convention | Ví dụ |
|------|-----------|-------|
| File | `snake_case` | `auth_service.dart` |
| Class | `PascalCase` | `AuthService` |
| Variable/method | `camelCase` | `getUserById` |
| Constant | `lowerCamelCase` | `const defaultTimeout = 30` |
| Private | `_camelCase` | `_internalState` |
| Extension | `PascalCase` | `StringExtension` |

## Checklist Review (2025)

- [ ] Dùng `riverpod_generator` (`@riverpod` annotation)?
- [ ] `riverpod_lint` được cấu hình trong `analysis_options.yaml`?
- [ ] `.autoDispose` được dùng cho providers không cần persist?
- [ ] `ref.watch` thay vì `ref.read` trong build()?
- [ ] Dùng `.select()` để tối ưu rebuild?
- [ ] `AsyncValue.when()` xử lý đủ loading/error/data?
- [ ] Feature-first folder structure?
- [ ] Không có logic trong `build()` method?
- [ ] Có unit test cho Notifier classes?
- [ ] `dart format` và `dart analyze` pass?
