# TypeScript Style Guide

## Strict Mode
```json
// tsconfig.json — luôn bật strict
{
  "compilerOptions": {
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true
  }
}
```

## Types vs Interfaces
```typescript
// Interface — dùng cho object shape & OOP
interface UserRepository {
  findById(id: string): Promise<User>;
  save(user: User): Promise<void>;
}

// Type — dùng cho union, intersection, utility types
type Status = 'active' | 'inactive' | 'pending';
type ApiResponse<T> = { data: T; error: string | null };
```

## Generic Types
```typescript
// ✅ Generic với constraint
async function fetchData<T extends Record<string, unknown>>(
  url: string
): Promise<T> {
  const response = await fetch(url);
  return response.json() as T;
}
```

## Tránh
- ❌ `any` — dùng `unknown` và type guard thay thế
- ❌ `as` casting bừa bãi
- ❌ Non-null assertion `!` không cần thiết
- ❌ Enum — dùng `const object` thay thế
