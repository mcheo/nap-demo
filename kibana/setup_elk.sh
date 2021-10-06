#/bin/bash

ELK_URL=http://localhost:9200

curl -X PUT "$ELK_URL/_cluster/settings?pretty" -H 'Content-Type: application/json' -d'
{
  "transient": {
    "cluster.routing.allocation.disk.threshold_enabled": "false"
  }
}'

curl -X PUT "$ELK_URL/_all/_settings?pretty" -H 'Content-Type: application/json' -d'
{
	"index.blocks.read_only_allow_delete": null
}
'


KIBANA_URL=http://localhost:5601
jq -s . false-positives-dashboards.ndjson | jq '{"objects": . }' | curl -k --location --request POST "$KIBANA_URL/api/kibana/dashboards/import"     --header 'kbn-xsrf: true'     --header 'Content-Type: text/plain' -d @-     | jq
jq -s . overview-dashboard.ndjson | jq '{"objects": . }' | curl -k --location --request POST "$KIBANA_URL/api/kibana/dashboards/import"     --header 'kbn-xsrf: true'     --header 'Content-Type: text/plain' -d @-     | jq
