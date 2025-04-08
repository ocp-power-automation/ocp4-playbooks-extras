for NAMESPACE in $(oc get namespaces -o json | jq -r '.items[] | select((.metadata.name | startswith("openshift") | not) and (.metadata.name | startswith("kube-") | not) and .metadata.name != "default") | .metadata.name')
do
TOTAL_NETWORK_POLICIES=$(oc get -n ${NAMESPACE} networkpolicies -ojson | jq -r '.items[].metadata.name')
if [ -z "${TOTAL_NETWORK_POLICIES}" ]
then
echo "NAMESPACE: ${NAMESPACE}"
oc get -n ${NAMESPACE} networkpolicies -ojson | jq -r '.items[].metadata.name'
fi
done
