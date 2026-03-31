
kmm Automation
==============

This playbook will:
- Install kmm operator


Requirements
------------

- Access to the cluster as a user with the cluster-admin role
- The cluster is in a known good state, without any errors
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys:
   ***username***, ***password*** and ***registry***


Role Variables
--------------
| Variable                       | Required | Default           | Comments                                       |
|--------------------------------|----------|-------------------|------------------------------------------------|
| kmm_enabled                    | no       |    false          | Set it to true to run this playbook            |
| kmm_registry_namespace         | no       | "openshift-kmm"   |  kmm registry namespace                        |
| kmm_catalogsource_name         | no       |                   | kmm Catalogsource Name                         |
| kmm_catalogsource_image        | no       |                   | kmm Catalogsource Image                        |
| cluster_upi                    | no       |    false          | #set to true if using UPI cluster              |

Dependencies
------------

- 

Example Playbook
----------------

```
  - name: Deploy kmm operator in OpenShift
    include_role:
      name: ocp-kmm
```

License
-------

See LICENCE.txt

Author Information
------------------

rajakumar.batulla@ibm.com
