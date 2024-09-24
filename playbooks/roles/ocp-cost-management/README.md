ocp-cost-management-operator
=========

This role is used to deploy Cost Management Operator.

Requirements
------------

- OCP 4.x healthy cluster on PowerVS.
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys:
   ***username***, ***password*** and ***registry***
- Need to connect to Sgnvpn and Redhat VPN on your machine.

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
| openshift_console_password                | yes       | false | oc login command password |
| catalog_image_tag                | yes       | false | index image build id |

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

Execution process
-----------------

```
  there are 4 playbooks available on tasks folder
   - main.yml
   - cmo-setup.yml
   - cmo-test.yml
   - cmo-cleanup.yml
```

main.yml - this is the main yaml file which is used to install,verify and validate cost managemenent operator.
cmo-setup.yml - this file is responsible for install iqe cost management plugin and dependencies on your machine,inorder to execute this we have to enable the cost_management_setup `cost_management_setup: true`
cmo-test.yml - after plugin installation is successful,we have to execute this file to run tests.
inorder to execute this we have to enable the cost_management_test `cost_management_test: true`
cmo-cleanup.yml - this file is use to cleanup all resources involved with this operator.



License
-------

See LICENCE.txt

Author Information
------------------

Pavan.Sadhana3@ibm.com
