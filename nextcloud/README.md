### Nextcloud

## WARNING
There is currently a bug with trusted domains and helm chart does crash
when nextcloud.trustedDomains is set
Just use the nextcloud.host
If you need multiple trusted hosts you are probably screwed

https://artifacthub.io/packages/helm/nextcloud/nextcloud

if external database is configured nextcloud will automaticlly
create apropriate database (e.g. download necessary postgresql chart)

kubectl create secret generic nextcloud-secret \
  -n nextcloud \
  --from-literal=username="$NEXTCLOUD_USERNAME" \
  --from-literal=password="$NEXTCLOUD_PASSWORD"
