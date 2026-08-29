ocp-descheduler
============

The Descheduler Operator lets OpenShift Container Platform administrators to configure the profiles based on specific strategies for evicting the pods for efficient resource utilization under conditions such as Nodes are underutilized or overutilize, When pods and affinity requirements has changed and no longer appropriate for certain nodes, Node failure requires pods to be moved, New nodes are added to clusters, Pods have been restarted too many times.

This playbook contains two modules:
1. Installation of the descheduler operator
2. Running the end to end tests for descheduler operator from `openshift-tests-private` repository that comprises with different test scenarios and profiles.


Requirements
------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys: ***username***, ***password*** and ***registry***


Role Variables
--------------

| Variable                          | Required | Default                                                                              | Comments                                                                                                                      |
|-----------------------------------|----------|--------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| descheduler_role_enable           | no       | false                                                                                | Set the flag `true` to run this playbook.                                                                                     |
| descheduler_operator_deploy       | no       | false                                                                                | Set the flag `true` to deploy descheduler operator.                                                                           |
| descheduler_catalogsource_image   | no       | `quay.io/openshift-release-dev/ocp-release-nightly:iib-int-index-art-operators-4.12` | Descheduler operator image index for catalog source, the default has been given for operator version 4.12 ART.                |
| descheduler_catalogsource_name    | no       | my-operator-catalog                                                                  | Custom catalog source name, if not defined default will be used.                                                              |
| descheduler_namespace             | no       | openshift-descheduler                                                                | Custom namespace name to create a new namespace, if not defined the default wil be used.                                      |
| descheduler_channel               | no       | 4.12                                                                                 | Channel version for the descheduler operator.                                                                                 |
| descheduler_e2e_tests_run         | no       | false                                                                                | Set the flag `true` for running descheduler e2e tests.                                                                        |
| descheduler_workdir               | no       | `/tmp/descheduler`                                                                   | Working directory for descheduler.                                                                                            |
| descheduler_e2e_repo              | no       | `https://github.com/openshift/openshift-tests-private`                               | GitHub repository for running the e2e tests.                                                                                  |
| descheduler_e2e_github_branch     | no       | master                                                                               | GitHub repository branch name for running the e2e tests.                                                                      |
| descheduler_go_tarball            | no       | `https://go.dev/dl/go1.18.4.linux-ppc64le.tar.gz`                                    | Golang tarball for `ppc64le` arch with version `>= 1.18`, the default is given for version `1.18.4` as a minimum requirement. |  


Environment Variables
---------------------

| Variable             | Required       | Comments 
|----------------------|----------------|--------------------------------------------
| GITHUB_USERNAME      | yes            | Public GitHub account username to which the repository access granted.
| GITHUB_ACCESS_TOKEN  | yes            | GitHub personal access token to clone the repository.


Dependencies
------------

- To run e2e test cases, it requires access permission to the `https://github.com/openshift/openshift-test-private` repository. To get the access please follow the GitHub account link instructions in Red Hat onboarding wiki.


Example Playbook
----------------

```
  - name: cluster-kube-descheduler-operator deployment playbook
    hosts: bastion
    roles:
    - ocp-descheduler
```


Steps to run playbook
----------------------

 - Copy `ocp4-playbooks-extras/examples/inventory` file to the home or working directory and modify it to add a remote host
 - Copy the `ocp4-playbooks-extras/examples/all.yaml` to the home or working directory and set the role variables for `roles/ocp-descheduler` with the custom inputs.
 - To execute the playbook run the below sample command


Sample Command
---------------

ansible-playbook -i inventory -e @all.yaml ~/ocp4-playbooks-extras/playbooks/main.yml


License
-------

See LICENCE.txt


Author Information
------------------

Aditya.Honkalas@ibm.com
