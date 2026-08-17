# Kubernetes — Hướng dẫn cơ bản

## Deployment Template
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    spec:
      containers:
        - name: my-app
          image: myapp:1.0.0
          ports: [{containerPort: 8000}]
          resources:
            requests: {cpu: "100m", memory: "128Mi"}
            limits:  {cpu: "500m", memory: "512Mi"}
          livenessProbe:
            httpGet: {path: /health, port: 8000}
          readinessProbe:
            httpGet: {path: /ready, port: 8000}
```

## TODO: Mở rộng khi cần
- [ ] Helm charts
- [ ] Horizontal Pod Autoscaler
- [ ] ConfigMap & Secrets management
- [ ] Ingress configuration
