# Python Code Review — Quy chuẩn PEP8 & Best Practices

## Formatting
- Dùng `black` hoặc `ruff` để format tự động
- Max 88 ký tự mỗi dòng (black default)
- Indent: 4 spaces

## Naming Convention
- Module/file: `snake_case.py`
- Class: `PascalCase`
- Function/variable: `snake_case`
- Constant: `UPPER_SNAKE_CASE`
- Private: `_single_underscore`

## Type Hints (bắt buộc)
```python
# ✅ Đúng
def process_user(user_id: int, name: str) -> dict[str, Any]:
    ...

# ❌ Sai
def process_user(user_id, name):
    ...
```

## Error Handling
```python
# ✅ Đúng — bắt lỗi cụ thể
try:
    result = await db.fetch(query)
except DatabaseError as e:
    logger.error("DB error: %s", e)
    raise

# ❌ Sai — bắt lỗi chung chung
try:
    ...
except Exception:
    pass
```

## Checklist Review
- [ ] Type hints đầy đủ
- [ ] Docstring cho public functions
- [ ] Không có magic numbers (dùng constant)
- [ ] Test coverage > 80%
- [ ] Không import không dùng
