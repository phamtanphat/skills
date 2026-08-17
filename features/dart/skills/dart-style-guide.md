# Dart Style Guide

## Formatting
- Dùng `dart format` trước khi commit
- Max 80 ký tự mỗi dòng
- Indent: 2 spaces

## Imports
```dart
// Thứ tự import:
import 'dart:async';           // 1. Dart core
import 'package:flutter/...'; // 2. Flutter packages
import 'package:my_app/...';  // 3. Package nội bộ
import '../relative/path.dart'; // 4. Relative imports
```

## Null Safety
- Luôn khai báo kiểu rõ ràng
- Tránh dùng `!` (null assertion) — xử lý null đúng cách
- Dùng `??` và `?.` thay vì check null thủ công

## Documentation
- Comment public API bằng `///`
- Mô tả `why` không phải `what`
