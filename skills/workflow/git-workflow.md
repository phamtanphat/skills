# Git Workflow — Quy trình chuẩn

## Branch Naming
```
main          — Production (không commit trực tiếp)
develop       — Integration branch
feature/xxx   — Tính năng mới
fix/xxx       — Sửa bug
hotfix/xxx    — Sửa khẩn cấp trên production
chore/xxx     — Cấu hình, dependency, cleanup
docs/xxx      — Tài liệu
```

## Commit Message (Conventional Commits)
```
<type>(<scope>): <subject>

feat(auth): thêm đăng nhập bằng Google OAuth
fix(cart): sửa lỗi tính tổng giá khi có discount
refactor(user): tách UserService thành module riêng
docs(readme): cập nhật hướng dẫn cài đặt
chore(deps): nâng version flutter lên 3.22
test(auth): thêm unit test cho login flow
```

## Pull Request
- Tiêu đề = commit message đầu tiên
- Mô tả: What + Why + How
- Tối đa 400 dòng thay đổi mỗi PR
- Phải có ít nhất 1 reviewer approve

## Quy trình
1. `git checkout -b feature/ten-tinh-nang` từ `develop`
2. Code + commit thường xuyên (atomic commits)
3. `git pull --rebase origin develop` trước khi push
4. Tạo PR → review → merge → xóa branch
