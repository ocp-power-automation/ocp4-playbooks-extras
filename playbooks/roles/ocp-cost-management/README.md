ocp-cost-management-operator
=========

This role is used to deploy Cost Management Operator.

Requirements
------------

- OCP 4.x healthy cluster on PowerVS.
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys:
   ***username***, ***password*** and ***registry***

Role Variables
--------------

| Variable                                   | Required | Default                                                                              | Comments                                                                                                                       |
|--------------------------------------------|----------|--------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| cost_management_enabled                            | no       | false                                                                                |                                                                        |
| cost_management_directory                   | no       | true                                                                                 |  operator                                                                      |
| cost_management_catalogsource_image               | no       | true                                                                                 |  operator                                                                            |
| cost_management_upgrade_channel                   | no       |                                                                               |                                                                                                        |
| cost_management_e2e                      | no       | ""                                                                    |                                                                                                          |
| cost_management_e2e_github_repo                | no       | "" |  |
| coo_channel                    | no       | development                                                                               | Operator upgrade channel                                                                                                       |
| cost_management_e2e_github_branch                | no       | "" |  |
| coo_channel                    | no       | development                                                                               | Operator upgrade channel                                                                                                       |
| cost_management_github_username                | no       | "" |  |
| coo_channel                    | no       | development                                                                               | Operator upgrade channel                                                                                                       |
| cost_management_github_token                | no       | "" |  |
| coo_channel                    | no       | development                                                                               | Operator upgrade channel                                                                                                       |
| cost_management_cleanup                | no       | "" |  |
| coo_channel                    | no       | development                                                                               | Operator upgrade channel                                                                                                       |

Dependencies
------------

- None


Example Playbook
----------------

```
  ---
- name: Installation of the cost management operator and run e2e
  hosts: bastion
  roles:
  - ocp-cost-management
```


License
-------

See LICENCE.txt

Author Information
------------------

Pavan.Sadhana3@ibm.com
