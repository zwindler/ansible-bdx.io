#!/bin/bash
curl -X GET -H "X-Auth-Token: $SCW_API_KEY" -H 'Content-Type: application/json' https://cp-par1.scaleway.com/images | jq '.images[] | select(.arch=="arm64") | select(.name=="Ubuntu Bionic Beaver") | .id'
