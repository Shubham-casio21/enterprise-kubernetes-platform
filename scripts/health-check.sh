#!/usr/bin/env bash
set -euo pipefail
NAMESPACE="${1:-enterprise-demo}"
kubectl -n "$NAMESPACE" get deployment,pods,svc
kubectl -n "$NAMESPACE" rollout status deployment/enterprise-platform --timeout=120s
