Container Security Operator Automation
=========

This playbook will:
- Install CSO operator

Requirements
------------

- Access to the cluster as a user with the cluster-admin role
- The cluster is in a known good state, without any errors
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys:
   ***username***, ***password*** and ***registry***


Role Variables
--------------
| Variable                       | Required | Default     | Comments                                       |
|--------------------------------|----------|-------------|------------------------------------------------|
| cso_enabled      | no       |    false    | Set it to true to run this playbook            |
| cso_namespace       | no     | "CSO-registry" |  CSO namespace   |
| cso_catalogsource_name       | no       |  | CSO Catalogsource Name   |
| cso_catalogsource_image      | no       |        | CSO Catalogsource Image |
| cso_operator_channel     | no       |        | CSO operator Image |


Example Playbook
----------------

```
  - name: Deploy CSO operator in OpenShift
    include_role:
      name: ocp-cso
```

License
-------

See LICENCE.txt

Author Information
------------------

yashansh.sharma@ibm.com