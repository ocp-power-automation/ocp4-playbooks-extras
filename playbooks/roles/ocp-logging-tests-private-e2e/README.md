ocp-logging-tests-private-e2e: OCP End to End Logging Test Cases
=========

This module will run end to end Logging related test cases from openshift-tests-private repo. Results will be stored in ~/ocp_logging_tests_private_e2e_results/ directory on bastion.

Requirements
------------

 - Running OCP 4.x cluster is needed.
 - **Note:** It is recommended to create catalog source with name "qe-app-registry" before running playbook.
   
Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| ocp_logging_tests_private_e2e_git               | no       | https://github.com/openshift/openshift-tests-private/        | Git repo url for the logging e2e tests                      |
| ocp_logging_tests_private_e2e_git_branch        | no       | release-4.12                               | Git repo branch for e2e tests  Eg: To test 5.6.x then use release-4.12 branch, for 5.7.x use release-4.13 branch.....for 6.0.x use release-4.16 branch.|
| ocp_logging_tests_private_e2e_dir               | no       | /tmp/ocp_logging_tests_private/                          | Test directory                                      |
| golang_tarball_logging_e2e              | no       | https://dl.google.com/go/go1.22.6.linux-ppc64le.tar.gz | HTTP URL for golang tarball             |
| ocp_logging_tests_private_e2e_enabled           | no       | false                                      | Flag to be set to true to enable logging e2e tests playbook |
| logging_e2e_testcases           | no       | false                                      | If set to critical it will run Critical logging tests else it will run all logging tests |

Dependencies
------------

 - None

Example Playbook
----------------
```
 ---
 - name: Run logging related e2e test cases from openshift-tests-private repo
   hosts: bastion
   roles:
   - ocp-logging-tests-private-e2e
```
  
License
-------

See LICENCE.txt

Author Information
------------------

Jeevan Darapu (Jeevan.Darapu@ibm.com)
