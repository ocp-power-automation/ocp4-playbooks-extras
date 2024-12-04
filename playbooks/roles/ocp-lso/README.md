ocp-cluster-observability-operator
=========

This role is used to deploy Local Storage Operator.

Requirements
------------

- OCP 4.x healthy cluster on PowerVS.
- OCP secret with name podman-secret in the default namespace which is used for global secret update and has following keys: 
   ***username***, ***password*** and ***registry***

Role Variables
--------------
| Variable                       | Required | Default     | Comments                                       |
|--------------------------------|----------|-------------|------------------------------------------------|
| lso_catalogsource_image        | no       |             | Catalog Source index image for LSO, If not defined then `registry.redhat.io/redhat/redhat-operator-index:v4.18-prerelease-local-storage-operator` will be used    |
| lso_namespace                  | no       | `openshift-local-storage`    | Namespace given for LSO    |
| lso_channel                    | no       |  `stable`    | Version Of LSO to be installed    |
| lso_catalogsource_name         | no       |  `my-operator-catalog`    | Catalog source name for LSO    |

Example Playbook
----------------

```
  ---
- name: Automate Local Storage Setup in OpenShift
  include_role:
  - ocp-lso
```

License
------------------

See LICENCE.txt


Author Information
------------------

Yashansh.Sharma@ibm.com