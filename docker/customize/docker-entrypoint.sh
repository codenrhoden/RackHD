#!/bin/sh

# set -x

# Wait for API to become available
curl -s 127.0.0.1:9090/api/1.1/skus
while ! [ $? -eq 0 ]; do
    sleep 5
    curl -s 127.0.0.1:9090/api/1.1/skus
done

# Upload our SKU definitions
curl 127.0.0.1:9090/api/1.1/skus | python -c "import sys; import json; map(lambda x: sys.stdout.write('%s\n'%x['name']), json.load(sys.stdin))" | grep -q "Small RAM node"

if ! [ $? -eq 0 ]; then
curl -X POST -H "Content-Type: application/json" \
     --data @/small_ram_sku.json \
     http://127.0.0.1:9090/api/1.1/skus
fi

curl 127.0.0.1:9090/api/1.1/skus | python -c "import sys; import json; map(lambda x: sys.stdout.write('%s\n'%x['name']), json.load(sys.stdin))" | grep -q "Large RAM node"

if ! [ $? -eq 0 ]; then
curl -X POST -H "Content-Type: application/json" \
     --data @/large_ram_sku.json \
     http://127.0.0.1:9090/api/1.1/skus
fi

# Add our default Workflow for the SKUs
curl -X PUT -H "Content-Type: application/json" \
     --data @/rancher_standby.json \
     http://127.0.0.1:9090/api/1.1/workflows

