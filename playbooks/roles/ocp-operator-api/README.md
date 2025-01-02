ocp-operator-api
=========

This role is used to validate operator development using operator-sdk.

Requirements
------------

- OCP 4.x healthy cluster on Power.


Role Variables
--------------

| Variable                                   | Required | Default                                                                              | Comments                                                                                                                       |
|--------------------------------------------|----------|--------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| op_api_role_enable                            | no       | false                                                                                | Set it to true to run this playbook                                                                                            |
| op_cleanup                            | no       | false                                                                                | Set it to true to do operator cleanup.                                                                                            |
| helm_op                   | no       | false                                                                                 | Set it to true to test helm based operator                                                                      |
| ansible_op                   | no       | false                                                                                 | Set it to true to test ansible based operator                                                                      |
| go_op                   | no       | false                                                                                 | Set it to true to test go based operator                                                                      |
| operator_sdk_version                    | no       | "1.38.0"                                                                               | Version of operator-sdk to be installed.                                                                                                       |
| op_api_dir                      | no       | "/tmp/operator-api"                                                                    | Directory where the operator workspace are intialized.                                                                                                         |
| quay_username                    | yes       |                                                                                | quay account username where the operator images will be pushed                                                                                                       |
| quay_token                    | yes       |                                                                                | quay account token to push the operator images                                                                                                        |




Dependencies
------------

- ansible-runner
- ansible-runner-http
- openshift

Example Playbook
----------------

```
---
- name: Validate Operator development and installation
  hosts: bastion
  tasks:
    - name: Validate Operator development and installation
      include_role:
        name: ocp-operator-api
```


License
-------

See LICENCE.txt

Author Information
------------------

Suraj.Gudaji1@ibm.com
