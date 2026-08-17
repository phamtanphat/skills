# React & TypeScript Patterns

## Component Structure
```tsx
// ✅ Chuẩn — Functional component với TypeScript
interface UserCardProps {
  userId: string;
  onSelect: (id: string) => void;
}

const UserCard: React.FC<UserCardProps> = ({ userId, onSelect }) => {
  return (
    <div onClick={() => onSelect(userId)}>
      {/* content */}
    </div>
  );
};

export default UserCard;
```

## Naming Convention
- Component file: `PascalCase.tsx`
- Hook file: `useCamelCase.ts`
- Utility file: `camelCase.ts`
- Type file: `*.types.ts`

## Custom Hooks
```tsx
// Tách logic vào custom hook
const useUserData = (userId: string) => {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchUser(userId).then(setUser).finally(() => setLoading(false));
  }, [userId]);

  return { user, loading };
};
```

## State Management
- Local state: `useState`, `useReducer`
- Server state: `TanStack Query` (React Query)
- Global state: `Zustand` hoặc `Jotai`
- Tránh dùng Context cho data thay đổi thường xuyên

## Checklist
- [ ] Props có TypeScript types đầy đủ
- [ ] Tránh `any` type
- [ ] Component < 150 dòng
- [ ] Có error boundary cho async components
