ocp-cluster-observability-operator
=========

This role is used to deploy Cluster Observability Operator.

Requirements
------------

- OCP 4.12+ healthy cluster on PowerVS.
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys:
   ***username***, ***password*** and ***registry***
- NFS-Storage class
- Loki-operator 5.8.1+ installed
- Cluster-logging operator 5.8.1+ installed
- Tempo Operator 0.13.0-1+ installed
- Open Telemetry Operator installed
- Loki Secrets used by lokistack to upload the logs to cloud storage bucket


Role Variables
--------------

| Variable                                   | Required | Default                                                                              | Comments                                                                                                                       |
|--------------------------------------------|----------|--------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| coo_role_enable                            | no       | false                                                                                | Set it to true to run this playbook                                                                                            |
| coo_operator_deploy                   | no       | true                                                                                 | Set it to true to install the cluster observality operator                                                                      |
| coo_cleanup               | no       | true                                                                                 | Set it to true to uninstall cluster observality operator                                                                            |
| enable_dashboard_uiplugin                   | no       | false                                                                                 | Set it to true to deploy dashboard UIPlugin                                                                    |
| enable_logging_uiplugin                   | no       | false                                                                                 | Set it to true to deploy  logging UIPlugin                                                                    |
| enable_distributed_tracing_uiplugin                   | no       | false                                                                                 | Set it to true to deploy distributed tracing console UIPlugin                                                                    |
| enable_troubleshootingpanel_uiplugin                   | no       | false                                                                                 | Set it to true to deploy troubleshootingpanel UIPlugin                                                                    |
| coo_namespace                    | no       | "openshift-observability-operator"                                                                               | Namespace where cluster observality operator is depoyed.                                                                                                       |
| coo_logstack_namespace                    | no       | "openshift-logging"                                                                               | Namespace where cluster logging operator is depoyed.                                                                                                       |
| coo_e2e_namespace                    | no       | "coo-e2e"                                                                               | Namespace where cluster observality operator instances are deployed.                                                                                                       |
| coo_catalogsource_name                      | no       | "coo-catalog"                                                                    | Custom catalog source name, if not defined default will be used.                                                                                                         |
| coo_catalogsource_image                | no       | "brew.registry.redhat.io/rh-osbs/iib:760399" | Custom catalog source index image for Cluster Observality Operator |
| coo_channel                    | no       | development                                                                               | Operator upgrade channel                                                                                                       |
| distributed_tracing_qe_repo                    | no       | https://github.com/openshift/distributed-tracing-qe.git                                                                               | Git Repo to deploy a TempoStack instance                                                                                                       |
| distributed_tracing_qe_repo_branch                    | no       | main                                                                               | Git branch to deploy a TempoStack instance                                                                                                       |
| chainsaw_tarball                    | no       | https://github.com/kyverno/chainsaw/releases/download/v0.2.9-beta.1/chainsaw_linux_ppc64le.tar.gz                                                                               | HTTPS URL for chainsaw tarball                                                                                                       |
| minio_image                | no       | "quay.io/minio/minio:latest" | Image used for multitenancy deployment |
| chainsaw_path                    | no       | /usr/local/                                                                               | chainsaw binary installation path                                                                                                      |
| chainsaw_test_namespace                    | no       |chainsaw-multitenancy                                                                               | Namespace created by chainsaw to deploy tempo instances                                                                                                         |
| coo_work_dir                    | no       | /tmp/coo_logs                                                                              | Working directory for cluster observability operator                                                                                                       |



Note
------------

```
TroubleShootingPanel UIPlugin is not supported on OCP 4.15 clusters or earlier versions
```


Example Playbook
----------------

```
  ---
- name: cluster-observability-operator deployment playbook
  hosts: bastion
  tasks:
  - name: Deploy Cluster Observability Operator
    include_role:
      name: ocp-coo
```


License
-------

See LICENCE.txt

Author Information
------------------

Suraj.Gudaji1@ibm.com
