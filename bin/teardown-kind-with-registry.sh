#!/usr/bin/env bash
# Tears down everything set up by setup-kind-with-registry.sh: the kind cluster and the local
# registry container.

set -euo pipefail

CLUSTER_NAME="kind"
REGISTRY_NAME="kind-registry"

echo "==> Deleting kind cluster '${CLUSTER_NAME}'..."
kind delete cluster --name "${CLUSTER_NAME}" || true

echo "==> Removing registry container '${REGISTRY_NAME}'..."
docker rm -f "${REGISTRY_NAME}" || true

echo "==> Done."
