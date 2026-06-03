# PEP8 Style Guide — Tóm tắt nhanh

## Khoảng cách
```python
# Xung quanh operator
x = 1 + 2       # ✅
x=1+2           # ❌

# Sau dấu phẩy
foo(a, b, c)    # ✅
foo(a,b,c)      # ❌
```

## Imports
```python
# Thứ tự (isort)
import os                          # 1. Standard library
import sys

import fastapi                     # 2. Third-party
import pydantic

from app.models import User        # 3. Local
from app.services import auth
```

## Docstrings
```python
def calculate_tax(amount: float, rate: float) -> float:
    """
    Tính thuế dựa trên số tiền và tỷ lệ.

    Args:
        amount: Số tiền gốc (VND)
        rate: Tỷ lệ thuế (0.0 - 1.0)

    Returns:
        Số tiền thuế cần nộp
    
    Raises:
        ValueError: Nếu rate không hợp lệ
    """
    if not 0 <= rate <= 1:
        raise ValueError(f"Rate phải từ 0 đến 1, nhận: {rate}")
    return amount * rate
```
