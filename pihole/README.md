# Pihole
https://artifacthub.io/packages/helm/mojo2600/pihole

Addblock
helm repo add mojo2600 https://mojo2600.github.io/pihole-kubernetes/

There needs to be an update job since old pihole used `adlists.list`,
but new ones use `sqllite` database.
This helm chart installs new version but works only on adlists.list

#TODO
Currently this is only script that is doing this
