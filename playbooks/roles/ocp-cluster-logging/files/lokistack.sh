#!/usr/bin/env bash

lokistack_name="${1:-lokistack-sample}"
lokistack_namespace="${2:-openshift-logging}"
lokistack_route=$(oc get route ${lokistack_name} -n ${lokistack_namespace} -o json |jq '.spec.host' -r)

## cluster-admin role is need for the below query.
bearer_token=$(oc whoami -t)
if [[ $bearer_token ==  "" ]];then
   "can not find the bearer token"
   exit 1
fi

echo "Query logType"
mkdir - lokistack
oc extract cm/kube-root-ca.crt --to=lokistack --confirm
oc extract cm/${lokistack_name}-ca-bundle --to=lokistack --confirm
cat lokistack/*.crt >lokistack_ca.crt


curl -G -k -H "Authorization: Bearer ${bearer_token}" -H "X-Scope-OrgID:infrastructure" https://${lokistack_route}/api/logs/v1/infrastructure/loki/api/v1/query_range --data-urlencode query='{log_type="infrastructure"}' --data-urlencode 'step=2m'  --data-urlencode "start=$(date +%s -d '2 hours ago')" --data-urlencode "end=$(date +%s)" > /root/clf_logs/lokistack/infrastructure.txt
curl -G -k -H "Authorization: Bearer ${bearer_token}" -H "X-Scope-OrgID:application" https://${lokistack_route}/api/logs/v1/application/loki/api/v1/query_range --data-urlencode query='{log_type="application"}' --data-urlencode 'step=2m'  --data-urlencode "start=$(date +%s -d '2 hours ago')" --data-urlencode "end=$(date +%s)" > /root/clf_logs/lokistack/application.txt
curl -G -k -H "Authorization: Bearer ${bearer_token}" -H "X-Scope-OrgID:audit" https://${lokistack_route}/api/logs/v1/audit/loki/api/v1/query_range --data-urlencode query='{log_type="audit"}' --data-urlencode 'step=2m'  --data-urlencode "start=$(date +%s -d '2 hours ago')" --data-urlencode "end=$(date +%s)" > /root/clf_logs/lokistack/audit.txt

