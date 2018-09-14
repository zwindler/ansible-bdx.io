#!/bin/bash
curl -X GET -H "X-Auth-Token: $SCW_API_KEY" -H 'Content-Type: application/json'  https://account.scaleway.com/organizations | jq .organizations[].id
