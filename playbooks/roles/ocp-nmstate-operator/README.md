ocp-nmstate-operator
=========

This role is used to deploy Kubernetes NMState Operator and run e2e tests.

Requirements
------------

- OCP 4.x healthy cluster on PowerVC.
- To run e2e, attach two additional networks to the worker nodes.
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys:
   ***username***, ***password*** and ***registry***

Role Variables
--------------

| Variable                     | Required | Default        | Comments                                                  |
|------------------------------|----------|----------------|-----------------------------------------------------------|
| nmstate_enabled              | no       | false          | Set it to true to run this playbook                       |
| nmstate_install_operator     | no       | true           | Set it to true to install the Kubernetes NMState Operator |
| nmstate_catalogsource_image  | no       | ""             | Custom catalog source index image for Kubernetes NMState Operator. If not defined, default `redhat-operators` catalog source will be used     |
| nmstate_upgrade_channel      | no       | stable         | Operator upgrade channel |
| nmstate_directory            | no       | `/tmp/nmstate` | Working directory for Kubernetes NMState Operator |
| nmstate_golang_tarball       | no       | https://go.dev/dl/go1.18.6.linux-ppc64le.tar.gz | HTTPS URL for golang tarball |
| nmstate_e2e                  | no       | false          | Set it to true to run e2e            |
| nmstate_e2e_git_repository   | no       | https://github.com/openshift/kubernetes-nmstate.git   | Git respository for e2e tests |
| nmstate_git_branch           | no       | master         | Git branch for e2e                   |
| nmstate_cleanup              | no       | true           | Flag is used to clean Kubernetes NMState Operator resources   |


Dependencies
------------

- None

Example Playbook
----------------
```
---
- name: Installation of the NMState Operator and run e2e
  hosts: bastion
  tasks:
  - name: Deploy NMState Operator
    include_role:
      name: ocp-nmstate-operator
```

License
-------

See LICENCE.txt

Author Information
------------------

varad.ahirwadkar@ibm.com
