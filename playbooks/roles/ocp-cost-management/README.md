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
| cost_management_enabled                            | yes       | false                                                                                |                                                                        |
| cost_management_directory                   | yes       | true                                                                                 |  cost management temporary directory                                                                     |
| cost_management_catalogsource_image               | yes       | true                                                                                 |  cost management catalogsource image                                                                            |
| cost_management_upgrade_channel                   | no       |                                                                               | channel                                                                                                       |
| cost_management_e2e                      | yes       |                                                                     |                                                                                                          |
| cost_management_e2e_github_repo                | yes       |  |  |
| cost_management_e2e_github_branch                | yes       |  |  |                                                                                     |
| cost_management_github_username                | yes       |  |  |
| cost_management_github_token                | yes       |  |  |  
| cost_management_cleanup                | yes       | false | to run cleanup playbook  |
| cost_management_setup                | yes       | false | to run cost management setup |
| cost_management_test                | yes       | false | to run cost management test |
| openshift_console_password                | yes       | false | to run cost management test |
| catalog_image_tag                | yes       | false | to run cost management test |

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
