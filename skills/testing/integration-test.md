# Integration Test — Hướng dẫn kiểm thử tích hợp

## Khi nào dùng Integration Test
- Test flow giữa nhiều layers (API → Service → DB)
- Test HTTP endpoints
- Test database queries thực
- Test message queue flows

## Tool theo ngôn ngữ
| Ngôn ngữ | Tool |
|----------|------|
| Flutter | `flutter_test`, `integration_test` |
| Python | `pytest`, `httpx`, `TestClient` |
| Node.js | `supertest`, `jest` |

## FastAPI Example
```python
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_create_user_returns_201():
    response = client.post("/users", json={
        "email": "test@example.com",
        "name": "Test User"
    })
    assert response.status_code == 201
    assert response.json()["email"] == "test@example.com"
```

## Checklist
- [ ] Test với database thật (test DB riêng)
- [ ] Reset data sau mỗi test (fixtures/transactions)
- [ ] Test cả happy path và error cases
- [ ] Không mock external services trong integration test
