#!/usr/bin/env bash
# Creates a kind cluster wired to a local image registry (localhost:5001) and installs
# ingress-nginx, matching what @QuarkusIntegrationTest's Kubernetes launch mode needs to test
# port-forward and ingress/external exposure locally.
#
# Registry is loopback-mapped (127.0.0.1:5001 -> registry container's 5000) so `docker push`
# from the host is auto-trusted (no insecure-registries/daemon.json changes needed) - same reason
# minikube's `localhost:5000` registry needs no special config.
#
# containerd needs the registry wired in via /etc/containerd/certs.d/<host>/hosts.toml, which
# only takes effect if config_path is set in containerd's config.toml. Passing this via
# `kind create cluster --config` (containerdConfigPatches) did NOT reliably take effect when this
# script was written - so config_path is set directly on each node's config.toml after cluster
# creation instead, which is verified to work.

set -euo pipefail

CLUSTER_NAME="kind"
REGISTRY_NAME="kind-registry"
REGISTRY_PORT="5001"

echo "==> Ensuring registry container '${REGISTRY_NAME}' is running on localhost:${REGISTRY_PORT}..."
if [ "$(docker inspect -f '{{.State.Running}}' "${REGISTRY_NAME}" 2>/dev/null || true)" != 'true' ]; then
  docker run -d --restart=always -p "127.0.0.1:${REGISTRY_PORT}:5000" --name "${REGISTRY_NAME}" registry:2
else
  echo "    already running"
fi

echo "==> Ensuring kind cluster '${CLUSTER_NAME}' exists..."
if ! kind get clusters 2>/dev/null | grep -qx "${CLUSTER_NAME}"; then
  kind create cluster --name "${CLUSTER_NAME}"
else
  echo "    already exists"
fi

echo "==> Connecting registry to the 'kind' docker network..."
if [ "$(docker inspect -f='{{json .NetworkSettings.Networks.kind}}' "${REGISTRY_NAME}")" = 'null' ]; then
  docker network connect kind "${REGISTRY_NAME}"
else
  echo "    already connected"
fi

echo "==> Wiring containerd on every node to use the registry as a mirror..."
for node in $(kind get nodes --name "${CLUSTER_NAME}"); do
  echo "    node: ${node}"

  if ! docker exec "${node}" grep -q 'config_path = "/etc/containerd/certs.d"' /etc/containerd/config.toml; then
    docker exec "${node}" sh -c 'printf "\n[plugins.\"io.containerd.grpc.v1.cri\".registry]\n  config_path = \"/etc/containerd/certs.d\"\n" >> /etc/containerd/config.toml'
  fi

  docker exec "${node}" mkdir -p "/etc/containerd/certs.d/localhost:${REGISTRY_PORT}"
  docker exec "${node}" sh -c "printf '[host.\"http://${REGISTRY_NAME}:5000\"]\n' > /etc/containerd/certs.d/localhost:${REGISTRY_PORT}/hosts.toml"

  docker exec "${node}" systemctl restart containerd
done

echo "==> Documenting the registry (local-registry-hosting ConfigMap in kube-public)..."
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: local-registry-hosting
  namespace: kube-public
data:
  localRegistryHosting.v1: |
    host: "localhost:${REGISTRY_PORT}"
    help: "https://kind.sigs.k8s.io/docs/user/local-registry/"
EOF

echo "==> Installing ingress-nginx (kind provider manifest)..."
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl wait --namespace ingress-nginx --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller --timeout=90s

echo "==> Done. Registry available at localhost:${REGISTRY_PORT}, e.g.:"
echo "    ./mvnw verify -Dk8s -Dquarkus.test.kubernetes.registry=localhost:${REGISTRY_PORT}"
