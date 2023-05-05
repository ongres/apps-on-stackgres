#!/bin/sh

PASSWORD="$(dd if=/dev/urandom bs=1 count=8 status=none | base64 | tr / 0)"

kubectl -n ferretdb create secret generic createuser \
  --from-literal=sql="create user ferretdb with password '"${PASSWORD}"'"
