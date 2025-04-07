# Grafana
username: admin
kubectl get secret --namespace default prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 --decode
kubectl port-forward svc/prometheus-stack-grafana 8080:80
