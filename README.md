# Enterprise Kubernetes Platform Modernization

Hands-on portfolio project demonstrating how a traditional application can be containerized and operated on Kubernetes with Jenkins, Helm and observability components.

## Architecture
Source -> Jenkins -> Docker image -> Registry -> Helm -> Kubernetes -> Service -> monitoring.

## What this demonstrates
- Containerization with a non-root image
- Jenkins pipeline validation, image build and Helm deployment
- Reusable Helm chart
- Rolling updates with maxUnavailable=0
- Liveness/readiness checks and resource controls
- Prometheus/Grafana stack values and operational health-check script

## Local test
```bash
docker build -t enterprise-platform .
docker run --rm -p 8080:8080 enterprise-platform
curl http://localhost:8080/healthz
```

## Kubernetes deployment
```bash
helm upgrade --install enterprise-platform helm/enterprise-platform -n enterprise-demo --create-namespace
./scripts/health-check.sh
```

## Observability
`monitoring/prometheus-values.yaml` is designed as a values overlay for the kube-prometheus-stack Helm chart.

## Scope
This is a reproducible portfolio/lab implementation. Production cloud networking, managed registries, IAM, secrets, TLS and persistent data services should be supplied by the target environment.
