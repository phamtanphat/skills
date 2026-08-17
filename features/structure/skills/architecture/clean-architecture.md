# Clean Architecture — Hướng dẫn tổ chức code

## Các tầng (Layers)
```
┌─────────────────────────────┐
│  Presentation (UI/API)      │ ← Widget, Screen, Controller, Router
├─────────────────────────────┤
│  Application (Use Cases)    │ ← Business rules, Interactors
├─────────────────────────────┤
│  Domain (Entities)          │ ← Models, Repository interfaces
├─────────────────────────────┤
│  Infrastructure (Data)      │ ← DB, API, Cache implementations
└─────────────────────────────┘
```

## Dependency Rule
> Dependencies chỉ được trỏ **từ ngoài vào trong**  
> Tầng trong KHÔNG biết tầng ngoài tồn tại

## Cấu trúc thư mục
```
lib/
├── features/
│   └── auth/
│       ├── presentation/    # UI
│       │   ├── pages/
│       │   └── widgets/
│       ├── application/     # Use cases
│       │   └── auth_service.dart
│       ├── domain/          # Core business
│       │   ├── models/
│       │   └── repositories/
│       └── infrastructure/  # Data sources
│           ├── api/
│           └── local/
└── core/                    # Shared utilities
    ├── error/
    ├── network/
    └── utils/
```

## Checklist
- [ ] Domain layer không import gì ngoài Dart core
- [ ] Repository chỉ là interface ở domain, implementation ở infrastructure
- [ ] Use case chỉ gọi repository, không gọi API trực tiếp
- [ ] Presentation chỉ gọi use case / service, không gọi repository
