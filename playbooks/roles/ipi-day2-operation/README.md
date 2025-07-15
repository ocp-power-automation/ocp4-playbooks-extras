IPI-day2-operations
=========

This play will perform the day2 operation on IPI cluster

This playbook will:
- Install RSCT operator
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
| enable_ipi_day2_operation      | no       |    false    | Set it to true to run this playbook            |
| rsct_git_repo                  | yes      | https://github.com/ocp-power-automation/rsct-operator.git  | RSCT git repo     |
| rsct_dir                       | no       | "{{ lookup('env', 'PWD') }}/rsct" | directory for RSCT         |
| rsct_namespace                 | no       | rsct-operator-system        | RSCT namespace |
| lso_index                      | no       |    " "    | Index image for LSO operator    |
| cluster_upi                    | no       |    false    | #set to true if using UPI cluster             |


Dependencies
------------

- Export KUBECONFIG
- Install go with version 1.22 and above
- Import LSO role
- Import ODF role

Example Playbook
----------------

```
- name: Run ipi day2 operation
  hosts: all
  tasks:
    - name: Fail incase 'KUBECONFIG' environment variable is an empty string
      fail:
        msg: KUBECONFIG environment variable must be a non-empty string
      when: (lookup('env', 'KUBECONFIG') == "")

    - include_role:
        name: ipi-day2-operation
      vars:
        KUBECONFIG: "{{ lookup('env', 'KUBECONFIG') }}"
```

License
-------

See LICENCE.txt

Author Information
------------------

swapnil.bobade@ibm.com
