# Prometheus
https://artifacthub.io/packages/helm/prometheus-community/prometheus

### USING DEFAULTS FOR NOW values.yaml is only prepered for now

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install prometheus-stack prometheus-community/kube-prometheus-stack

kubectl port-forward svc/prometheus-server 8080:9090


# Grafana
username: admin
kubectl get secret --namespace default prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 --decode
kubectl port-forward svc/prometheus-stack-grafana 8080:80
