#!/bin/bash
curl -X GET -H "X-Auth-Token: $SCW_API_KEY" -H 'Content-Type: application/json' https://cp-par1.scaleway.com/images | jq -r '.images[] | select(.name|contains("CentOS")) | .id,.name,.arch,.modification_date'
