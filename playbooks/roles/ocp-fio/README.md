ocp-fio
=========

This role is used to deploy File Integrity Operator and run e2e test cases from openshift-test-private repository.

Requirements
------------

- OCP 4.x healthy cluster
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys:
   ***username***, ***password*** and ***registry***


Role Variables
--------------

| Variable                 | Required | Default     | Comments                                              |
|--------------------------|----------|-------------|-------------------------------------------------------|
| fio_enabled              | no       | false       | Set it to true to run this playbook                   |
| fio_install_operator     | no       | true        | Set it to true to install the File Integrity Operator |
| fio_enable_global_secret | no       | false       | Role var to update the global pull-secret.            |
| fio_catalogsource_image  | no       | ""          | Custom catalog source index image for File Integrity Operator. If not defined, default `redhat-operators` catalog source will be used      |
| fio_upgrade_channel      | no       | stable      | Operator upgrade channel |
| fio_directory            | no       | `/tmp/fio`  | Working directory for File Integrity Operator |
| fio_config_name          | no       | ""          | Point to a ConfigMap containing an AIDE configuration to use instead of the CoreOS optimized default |
| fio_config_key           | no       | ""          | The key points to a key inside that config map. Use the key attribute to specify a custom key that contains the actual config and defaults to aide.conf |
| fio_config_grace_period  | no       | 900         | The number of seconds to pause in between AIDE integrity checks in seconds |
| fio_config_max_backups   | no       | 5           | The maximum number of AIDE database and log backups (leftover from the re-init process) to keep on a node |
| fio_node_selector        | no       | ""          | Selector for nodes to schedule the scan instances on |
| fio_default_config       | no       | true        | Flag is set to true to use default configuration     |
| fio_debug                | no       | false       | If set to true, the daemon running in the AIDE deamon set's pods would output extra information |
| fio_golang_tarball       | no       |  https://go.dev/dl/go1.22.4.linux-ppc64le.tar.gz | HTTPS URL for golang tarball |
| fio_e2e                  | no       | false       | Set it to true to run e2e            |
| fio_e2e_git_repository   | no       | ""          | Git respository for e2e tests        |
| fio_git_username         | no       | ""          | Github username                      |
| fio_git_token            | no       | ""          | Github token                         |
| fio_git_branch           | no       | master      | Git branch for e2e                   |
| fio_cleanup              | no       | true        | Flag is used to clean File Integrity Operator resources  |

Note: 
- To deploy FileIntegrity custom instance with custom configuration, please set atleast one varibale from the following variables, `fio_config_name`, `fio_config_key`, `fio_config_grace_period`, `fio_config_max_backups` or we can use default configuration using `fio_default_config`.

- `fio_default_config` has higher precedence.

- To run e2e tests, please set the following variables, `fio_e2e`, `fio_e2e_git_repository`, `fio_git_username`, `fio_git_token`.

Dependencies
--------------
- To run e2e test cases, it requires access to the openshift-test-private repository.

Example Playbook
----------------

```
---
- name: Run File Integrity Operator
  hosts: bastion
  tasks:
  - name: Deploy File Integrity Operator and run e2e tests
    include_role:
      name: ocp-fio

```

License
-------

See LICENCE.txt

Author Information
------------------

varad.ahirwadkar@ibm.com
