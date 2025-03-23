https://artifacthub.io/packages/helm/nextcloud/nextcloud

kubectl config set-context --current --namespace=nextcloud

kubectl create secret generic nextcloud-secret \
  -n nextcloud \
  --from-literal=username="$NEXTCLOUD_USERNAME" \
  --from-literal=password="$NEXTCLOUD_PASSWORD"


helm repo add nextcloud https://nextcloud.github.io/helm/
helm repo update

helm install nextcloud nextcloud/nextcloud -n nextcloud -f values.yaml

kubectl port-forward svc/nextcloud 8080:8080 -n nextcloud
