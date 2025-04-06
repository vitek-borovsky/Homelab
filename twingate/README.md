# Twingate
https://artifacthub.io/packages/helm/connector/connector

an VPN-like service for remote access

```bash
ACCESS="...."
REFRESH="...."
kubectl create secret generic twingate-credentials \
  --from-literal=TWINGATE_ACCESS_TOKEN="$ACCESS" \
  --from-literal=TWINGATE_REFRESH_TOKEN="REFRESH" \
  --namespace=twingate
```
