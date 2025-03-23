kubectl run postgress-postgresql-client --rm --tty -i --restart='Never' --namespace nextcloud --image docker.io/bitnami/postgresql:17.4.0-debian-12-r10 --env="PGPASSWORD=$POSTGRES_PASSWORD" \
      --command -- psql --host postgress-postgresql -U myuser -d mydatabase -p 5432
