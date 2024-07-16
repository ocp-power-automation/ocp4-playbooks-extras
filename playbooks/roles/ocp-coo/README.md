ocp-cluster-observability-operator
=========

This role is used to deploy Cluster Observability Operator.

Requirements
------------

- OCP 4.x healthy cluster on PowerVS.
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys:
   ***username***, ***password*** and ***registry***

Role Variables
--------------

| Variable                                   | Required | Default                                                                              | Comments                                                                                                                       |
|--------------------------------------------|----------|--------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| coo_role_enable                            | no       | false                                                                                | Set it to true to run this playbook                                                                                            |
| coo_operator_deploy                   | no       | true                                                                                 | Set it to true to install the cluster observality operator                                                                      |
| coo_cleanup               | no       | true                                                                                 | Set it to true to uninstall cluster observality operator                                                                            |
| coo_namespace                    | no       | "openshift-observability-operator"                                                                               | Namespace where cluster observality operator is depoyed.                                                                                                       |
| coo_catalogsource_name                      | no       | "coo-catalog"                                                                    | Custom catalog source name, if not defined default will be used.                                                                                                         |
| coo_catalogsource_image                | no       | "brew.registry.redhat.io/rh-osbs/iib:760399" | Custom catalog source index image for Cluster Observality Operator |
| coo_channel                    | no       | development                                                                               | Operator upgrade channel                                                                                                       |




Dependencies
------------

- None


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
