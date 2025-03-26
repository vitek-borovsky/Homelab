### Nextcloud

## WARNING
There is currently a bug with trusted domains and helm chart does crash
when nextcloud.trustedDomains is set
Just use the nextcloud.host
If you need multiple trusted hosts you are probably screwed

https://artifacthub.io/packages/helm/nextcloud/nextcloud

if external database is configured nextcloud will automaticlly
create apropriate database (e.g. download necessary postgresql chart)

kubectl config set-context --current --namespace=nextcloud

kubectl create secret generic nextcloud-secret \
  -n nextcloud \
  --from-literal=username="$NEXTCLOUD_USERNAME" \
  --from-literal=password="$NEXTCLOUD_PASSWORD"


helm repo add nextcloud https://nextcloud.github.io/helm/
helm repo update

helm install nextcloud nextcloud/nextcloud -n nextcloud -f values.yaml
helm upgrade nextcloud nextcloud/nextcloud -f values.yaml

kubectl port-forward svc/nextcloud 8080:80 -n nextcloud

10.244.0.86 - - [24/Mar/2025:23:34:48 +0000] "GET / HTTP/1.1" 400 13959 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36"
