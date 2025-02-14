ocp-sso
=========

The Secondary Scheduler Operator for Red Hat OpenShift provides a way to deploy a custom secondary scheduler in OpenShift Container Platform. The secondary scheduler runs alongside the default scheduler to schedule pods. Pod configurations can specify which scheduler to use.

The custom scheduler must have the /bin/kube-scheduler binary and be based on the [Kubernetes scheduling framework](https://kubernetes.io/docs/concepts/scheduling-eviction/scheduling-framework/).

The Secondary Scheduler Operator creates the default roles and role bindings required by the secondary scheduler. You can specify which scheduling plugins to enable or disable by configuring the KubeSchedulerConfiguration resource for the secondary scheduler.


This playbook will install Secondary Scheduler Operator and run the e2e from the openshift-test-private repository.


Requirements
------------

- Running OCP 4.x cluster is needed..
- The cluster is in a known good state, without any errors.
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys: ***username***, ***password*** and ***registry***
- Note: It is recommended to create catalog source with name "qe-app-registry" before running playbook.

Role Variables
--------------

Role Variables
--------------
| Variable                       | Required | Default     | Comments                                       |
|--------------------------------|----------|-------------|------------------------------------------------|
| sso_enabled                    | no       |   false     | Set it to true to run this playbook            |
| sso_directory                  | no       | `/tmp/sso`  | Working directory for secondary scheduler operator|
| sso_catalogsource_image        | yes       |             | Catlog source index image. If not defined, default `redhat-operators` catalog source will be used |
| sso_upgrade_channel            | no       |    stable   | Channel version for the secondary scheduler operator|
| sso_schedulerImage             | no       | registry.k8s.io/scheduler-plugins/kube-scheduler:v0.30.6 | k8s client package  versions that the scheduler-plugins are compiled with |
| sso_go_tarball                 | no       | https://go.dev/dl/go1.22.4.linux-ppc64le.tar.gz | HTTPS URL for golang tarball |
| sso_e2e                        | no       |    false    | Set it true for running e2e tests              |
| sso_e2e_github_repo            | no       | https://github.com/openshift/openshift-tests-private.git     | github repository for running e2e tests |
| sso_e2e_github_branch          | no       |    master   | github repository branch for running e2e tests |
| sso_github_username            | yes      |             | Github username                                |
| sso_github_token               | yes      |             | Github token                                   |
| sso_cleanup                    | no       |    true     | Uninstall and cleanup any existing installed version of secondary scheduler operator |

Dependencies
------------

- To run e2e test cases, it requires access to the openshift-test-private repository.

Example Playbook
----------------

```
- name: Deploy Secondary Scheduler Operator and run e2e
  hosts: bastion
  roles:
  - ocp-sso
```

Steps to run playbook
----------------------

 - Copy `ocp4-playbooks-extras/examples/inventory` file to the home or working directory and modify it to add a remote host
 - Copy the `ocp4-playbooks-extras/examples/ocp_sso_vars.yaml` to the home or working directory and set the role variables for `roles/ocp-sso` with the custom inputs.
 - To execute the playbook run the below sample command


Sample Command
---------------

ansible-playbook -i inventory -e @ocp_sso_vars.yaml ~/ocp4-playbooks-extras/playbooks/ocp-sso.yml 

License
-------

See LICENCE.txt

Author Information
------------------

aniruddha.nayek@ibm.com

