ocp-cost-management-operator
=========

This role is used to deploy Cost Management Operator.

Requirements
------------

- OCP 4.x healthy cluster on Power.
- Need to connect to Sgnvpn and Redhat VPN on your machine inorder to running tests.

Role Variables
--------------

| Variable                                   | Required | Default                                                                              | Comments                                                                                                                       |
|--------------------------------------------|----------|--------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| cost_management_enabled                            | yes       | false                                                                                |   enable the cost management if required                                                                       |
| cost_management_directory                   | yes       | /tmp/costmanagement                                                                                |  cost management temporary directory                                                                     |
| cost_management_catalogsource_image               | yes       | ""                                                                                 |  index image build id                                                                           |
| cost_management_upgrade_channel                   | no       | stable                                                                              | channel                                                                                                       |
| cost_management_e2e                      | yes       |  false                                                                   |                                                                                                          |
| cost_management_e2e_github_repo                | yes       |""  |  |
| cost_management_e2e_github_branch                | yes       |master  |  |                                                                                     |
| cost_management_github_username                | yes       |""  |  |
| cost_management_github_token                | yes       |""  |  |  
| cost_management_cleanup                | yes       | true | to run cleanup playbook  |
| cost_management_setup                | yes       | false | to run cost management setup |
| cost_management_test                | yes       | false | to run cost management test |
| openshift_console_password                | yes       | "" | oc login command password |


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

  there are 4 playbooks available on tasks folder
   - main.yml
   - cmo-setup.yml
   - cmo-test.yml
   - cmo-cleanup.yml

**var filepath:**
examples/ocp_cost_management_vars.yaml

**main.yml**
This is the main yaml file which is used to install,verify and validate cost management operator.

**cmo-setup.yml**
This file is responsible for install iqe cost management plugin and dependencies on your machine,
inorder to execute this we have to enable the cost_management_setup  in var file.
`cost_management_setup: true`

**cmo-test.yml**
After plugin installation is successful,we have to execute this file to run tests.
inorder to execute this we have to enable the cost_management_test in var file.
`cost_management_test: true`
Also we have to pass the kubeadmin password to this variable `openshift_console_password` in var file.

**cmo-cleanup.yml**
This file is use to cleanup all resources involved with this operator.
inorder to execute this we have to enable the cost_management_cleanup in var file.
`cost_management_cleanup: true`

Run Playbook
------------

To set up variables for specific playbook make use of the sample file at examples/<playbook_vars.yaml>. Modify the values as per your cluster. For more information refer to examples.

```
cp examples/ocp_cost_management_vars.yaml
```
Once you have configured the vars & inventory file, run the specific playbook using:

```
ansible-playbook  -i inventory -e @ocp_cost_management_vars.yaml playbooks/main.yml
```


License
-------

See LICENCE.txt

Author Information
------------------

Pavan.Sadhana3@ibm.com
