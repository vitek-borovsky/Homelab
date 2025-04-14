#!/bin/bash

set -eu
set -x

POD=$1

kubectl exec $POD -- apk add sqlite

ad_lists_list=$(kubectl exec $POD -- cat /etc/pihole/adlists.list)


while IFS= read -r ad_list_entry; do
    echo "$ad_list_entry"

    kubectl exec $POD -- sudo sqlite3 /etc/pihole/gravity.db <<EOF
INSERT INTO adlist (address, enabled) VALUES ('$ad_list_entry', 1);
EOF

done <<< "$ad_lists_list"

kubectl exec $POD -- pihole -g
