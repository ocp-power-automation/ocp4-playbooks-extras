ocp-e2e: OCP End to End Test Cases
=========

This module will run end to end test cases. Results will be stored in ~/e2e_tests_results/ directory on bastion.

Requirements
------------

 - Running OCP 4.x cluster is needed.

Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| e2e_tests_git               | no       | https://github.com/openshift/origin        | Git repo url for the e2e tests                      |
| e2e_tests_git_branch        | no       | release-4.12                               | Git repo branch for e2e tests                       |
| e2e_tests_exclude_list_url  | no       | ""                                         | URL to list of testcases to be excluded             |
| e2e_tests_dir               | no       | /tmp/openshift_ws                          | Test directory                                      |
| e2e_upgrade_image           | no       | ""                                         | The cluster will be upgraded to this image by e2e. In case of an empty string, the upgrade won't be done. |
| golang_tarball              | no       | https://dl.google.com/go/go1.18.6.linux-ppc64le.tar.gz | HTTP URL for golang tarball             |
| github_token                | no       | ""                                         | Github token used for authentication                |
| e2e_tests_enabled           | no       | false                                      | Flag to be set to true to enable e2e tests playbook |

Dependencies
------------

 - None

Example Playbook
----------------

    - name: Run e2e test cases
      hosts: bastion
      roles:
      - ocp-e2e

License
-------

See LICENCE.txt

Author Information
------------------

Prajyot Parab (prajyot.parab@ibm.com)
