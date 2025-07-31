#!/bin/sh

oc apply -f - <<EOF
apiVersion: config.openshift.io/v1
kind: ImageDigestMirrorSet
metadata:
  name: fbc-clo-testing-idms
spec:
  imageDigestMirrors:
  - mirrors:
    - quay.io/redhat-user-workloads/obs-logging-tenant/loki-operator-bundle-v$1
    source: registry.redhat.io/openshift-logging/loki-operator-bundle
  - mirrors:
    - quay.io/redhat-user-workloads/obs-logging-tenant/cluster-logging-operator-bundle-v$1
    source: registry.redhat.io/openshift-logging/cluster-logging-operator-bundle
  - mirrors:
    - brew.registry.redhat.io
    source: registry-proxy.engineering.redhat.com
  - mirrors:
    - quay.io/redhat-user-workloads/obs-logging-tenant/cluster-logging-operator-v$1
    source: registry.redhat.io/openshift-logging/cluster-logging-rhel9-operator
  - mirrors:
    - quay.io/redhat-user-workloads/obs-logging-tenant/logging-vector-v$1
    source: registry.redhat.io/openshift-logging/vector-rhel9
  - mirrors:
    - quay.io/redhat-user-workloads/obs-logging-tenant/log-file-metric-exporter-v$1
    source: registry.redhat.io/openshift-logging/log-file-metric-exporter-rhel9
  - mirrors:
    - quay.io/redhat-user-workloads/obs-logging-tenant/log-file-metric-exporter-v$1
    source: registry.redhat.io/openshift-logging/log-file-metric-exporter-rhel9
  - mirrors:
    - quay.io/redhat-user-workloads/obs-logging-tenant/logging-eventrouter-v$1
    source: registry.redhat.io/openshift-logging/eventrouter-rhel9
  - mirrors:
    - quay.io/redhat-user-workloads/obs-logging-tenant/loki-operator-v$1
    source: registry.redhat.io/openshift-logging/loki-rhel9-operator
  - mirrors:
    - quay.io/redhat-user-workloads/obs-logging-tenant/logging-loki-v$1
    source: registry.redhat.io/openshift-logging/logging-loki-rhel9
  - mirrors:
    - quay.io/redhat-user-workloads/obs-logging-tenant/lokistack-gateway-v$1
    source: registry.redhat.io/openshift-logging/lokistack-gateway-rhel9
  - mirrors:
    - quay.io/redhat-user-workloads/obs-logging-tenant/opa-openshift-v$1
    source: registry.redhat.io/openshift-logging/opa-openshift-rhel9
EOF
