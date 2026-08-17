# Microservices — Hướng dẫn kiến trúc

## Nguyên tắc
- Mỗi service có **một trách nhiệm** duy nhất
- Services giao tiếp qua **API** hoặc **message queue**
- Mỗi service có **database riêng** (không share)
- Deploy độc lập

## Communication Patterns
```
Synchronous:   REST API, gRPC
Asynchronous:  Message Queue (RabbitMQ, Kafka, Pub/Sub)
```

## Service Template
```
my-service/
├── src/
│   ├── api/          # HTTP handlers
│   ├── domain/       # Business logic
│   ├── infra/        # DB, external APIs
│   └── main.py
├── tests/
├── Dockerfile
├── docker-compose.yml
└── README.md
```

## TODO: Mở rộng khi cần
- [ ] API Gateway patterns
- [ ] Service mesh (Istio)
- [ ] Event sourcing
- [ ] CQRS pattern
