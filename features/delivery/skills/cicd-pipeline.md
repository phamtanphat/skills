# CI/CD Pipeline — Hướng dẫn tự động hóa

## GitHub Actions Template
```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: |
          pip install -r requirements.txt
          pytest --cov=app tests/

  build:
    needs: test
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
      - name: Build Docker image
        run: docker build -t myapp:${{ github.sha }} .

  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment: production
    steps:
      - name: Deploy to server
        run: echo "Deploy logic here"
```

## Stages chuẩn
1. **Lint** — Code style check
2. **Test** — Unit + Integration tests
3. **Build** — Compile/build artifacts
4. **Security scan** — Dependency vulnerabilities
5. **Deploy staging** — Auto deploy to staging
6. **E2E test** — Test trên staging
7. **Deploy production** — Manual approval required

## TODO: Mở rộng khi cần
- [ ] GitLab CI template
- [ ] Firebase App Distribution
- [ ] App Store deployment
