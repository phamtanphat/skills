# Docker Guide — Containerization

## Dockerfile Best Practices
```dockerfile
# ✅ Dùng multi-stage build để giảm image size
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.12-slim AS runtime
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.12 /usr/local/lib/python3.12
COPY . .

# Chạy với non-root user
RUN useradd -m appuser
USER appuser

EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
```

## Docker Compose cho Development
```yaml
services:
  app:
    build: .
    ports: ["8000:8000"]
    volumes: [".:/app"]  # Hot reload
    depends_on: [db, redis]
    env_file: .env.local

  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: myapp
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
    volumes: ["postgres_data:/var/lib/postgresql/data"]

  redis:
    image: redis:7-alpine

volumes:
  postgres_data:
```

## Checklist
- [ ] `.dockerignore` có `node_modules`, `.git`, `__pycache__`
- [ ] Dùng multi-stage build
- [ ] Không hardcode secrets trong Dockerfile
- [ ] Health check được định nghĩa
- [ ] Image tag cụ thể, không dùng `latest`
