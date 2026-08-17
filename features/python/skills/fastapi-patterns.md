# Python & FastAPI Best Practices (2025)
# Nguồn: FastAPI docs, SQLAlchemy 2.0 docs, Pydantic v2 docs, Real Python

## 1. Project Structure chuẩn

```
app/
├── api/
│   ├── v1/
│   │   ├── endpoints/
│   │   │   ├── users.py
│   │   │   └── auth.py
│   │   └── router.py
│   └── deps.py              # Dependency injection
├── core/
│   ├── config.py            # pydantic-settings
│   ├── security.py          # JWT, hashing
│   └── database.py          # Async engine, session
├── models/                  # SQLAlchemy ORM models
├── schemas/                 # Pydantic v2 schemas
├── services/                # Business logic layer
├── repositories/            # Data access layer (CRUD)
├── alembic/                 # Migrations
└── main.py
```

## 2. Async Database — SQLAlchemy 2.0 + asyncpg

```python
# core/database.py
from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker, AsyncSession
from typing import AsyncGenerator

# ✅ Dùng asyncpg driver cho PostgreSQL
DATABASE_URL = "postgresql+asyncpg://user:pass@localhost:5432/db"

engine = create_async_engine(
    DATABASE_URL,
    pool_size=10,
    max_overflow=20,
    echo=False,  # True khi debug
)

# expire_on_commit=False để tránh lỗi sau commit
SessionLocal = async_sessionmaker(
    bind=engine,
    expire_on_commit=False,
    class_=AsyncSession,
)

# Dependency injection
async def get_db() -> AsyncGenerator[AsyncSession, None]:
    async with SessionLocal() as session:
        try:
            yield session
            await session.commit()
        except Exception:
            await session.rollback()
            raise
```

## 3. Pydantic v2 — Schemas chuẩn

```python
from pydantic import BaseModel, EmailStr, field_validator, model_validator
from datetime import datetime

class UserCreate(BaseModel):
    email: EmailStr
    name: str
    password: str

    @field_validator('password')  # ✅ Pydantic v2 syntax
    @classmethod
    def password_strength(cls, v: str) -> str:
        if len(v) < 8:
            raise ValueError('Password phải có ít nhất 8 ký tự')
        return v

class UserResponse(BaseModel):
    id: int
    email: str
    name: str
    created_at: datetime

    model_config = {"from_attributes": True}  # ✅ Pydantic v2 (thay orm_mode)
```

## 4. Async Rules — Quy tắc bắt buộc

```python
# ✅ ĐÚNG — async cho I/O bound
async def get_user(user_id: int, db: AsyncSession) -> User:
    result = await db.execute(select(User).where(User.id == user_id))
    return result.scalar_one_or_none()

# ✅ ĐÚNG — dùng httpx thay requests
async def call_external_api(url: str) -> dict:
    async with httpx.AsyncClient() as client:
        response = await client.get(url, timeout=10.0)
        return response.json()

# ❌ SAI — blocking call trong async function
async def bad_example():
    import requests
    return requests.get("https://api.example.com")  # Blocks event loop!

# ❌ SAI — time.sleep trong async
async def bad_sleep():
    import time
    time.sleep(1)  # Dùng: await asyncio.sleep(1)
```

## 5. Endpoint Pattern chuẩn

```python
from fastapi import APIRouter, Depends, HTTPException, status

router = APIRouter(prefix="/users", tags=["users"])

@router.post("/", response_model=UserResponse, status_code=status.HTTP_201_CREATED)
async def create_user(
    body: UserCreate,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_active_user),
) -> UserResponse:
    """Tạo user mới. Yêu cầu xác thực."""
    # Tách logic vào service layer
    return await user_service.create(db=db, data=body)

@router.get("/{user_id}", response_model=UserResponse)
async def get_user(
    user_id: int,
    db: AsyncSession = Depends(get_db),
) -> UserResponse:
    user = await user_service.get_by_id(db=db, user_id=user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User không tồn tại")
    return user
```

## 6. Configuration — pydantic-settings

```python
# core/config.py
from pydantic_settings import BaseSettings, SettingsConfigDict

class Settings(BaseSettings):
    # Database
    database_url: str
    
    # Auth
    secret_key: str
    algorithm: str = "HS256"
    access_token_expire_minutes: int = 30
    
    # App
    debug: bool = False
    api_v1_prefix: str = "/api/v1"
    
    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        case_sensitive=False,
    )

# Singleton pattern
from functools import lru_cache

@lru_cache
def get_settings() -> Settings:
    return Settings()
```

## 7. Tooling Stack 2025

| Tool | Mục đích | Lệnh |
|------|---------|------|
| `ruff` | Lint + Format (thay black + flake8 + isort) | `ruff check . && ruff format .` |
| `mypy` | Static type checking | `mypy app/` |
| `pytest` + `pytest-asyncio` | Testing async code | `pytest -v` |
| `alembic` | DB migrations | `alembic upgrade head` |
| `pydantic-settings` | Config từ env | - |

## Checklist Review (2025)

- [ ] Dùng `async def` + `await` cho tất cả I/O operations?
- [ ] Database driver là `asyncpg` (không phải `psycopg2`)?
- [ ] `expire_on_commit=False` trong `async_sessionmaker`?
- [ ] Pydantic v2 syntax (`field_validator`, `model_config`)?
- [ ] Không dùng `requests` hay `time.sleep` trong `async def`?
- [ ] Logic nằm trong `services/`, không trong endpoint handlers?
- [ ] `pydantic-settings` cho config (không hardcode)?
- [ ] Alembic migrations cho mọi schema change?
- [ ] `ruff` và `mypy` pass?
- [ ] Test coverage > 80%?
