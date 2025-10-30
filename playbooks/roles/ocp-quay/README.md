
Quay Automation
=========

This playbook will:
- Install Quay operator
- Install LSO operator
- Install ODF operator

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
| quay_enabled      | no       |    false    | Set it to true to run this playbook            |
| quay_registry_namespace       | no     | "quay-registry" |  Quay registry namespace   |
| quay_catalogsource_name       | no       |  | Quay Catalogsource Name   |
| quay_catalogsource_image      | no       |        | Quay Catalogsource Image |
| lso_index                      | no       |    " "    | Index image for LSO operator    |
| odf_index                  | no       |    " "    | Index image for ODF operator    |
| odf_channel                | no | It uses default channel | It is used to set subscription channel for ODF Operator |
| cluster_upi                    | no       |    false    | #set to true if using UPI cluster             |
| volume_path                  | no       |    false    | #Get the volume path using "ls /dev/disk/by-id/"           |

Dependencies
------------

- Import LSO role
- Import ODF role

Example Playbook
----------------

```
  - name: Deploy Quay operator in OpenShift
    include_role:
      name: ocp-quay
```

License
-------

See LICENCE.txt

Author Information
------------------

yashansh.sharma@ibm.com
