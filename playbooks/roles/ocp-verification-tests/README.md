ocp-verification-tests
===================

This module will configure and run the verification tests. Results will be stored in ~/verification-tests/result/ directory on bastion.

Requirements
------------

 - Running OCP 4.x cluster is needed.
 - Role ocp-htpasswd-identity-provider - it creates user `testuser` using HTPasswd identity provider.

Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| verification_enabled        | no       | false                    | Flag to be set to true to enable verification tests playbook    |
| verification_dir            | no       | /root/verification-tests | Test directory  |
| verification_git_repo       | no       | https://github.com/openshift/verification-tests | Git repo url for the verification tests      |
| verification_git_branch     | no       | master                   | Git repo branch for the verification tests      |
| verification_feature_test   | no       | ""                       | Feature file to be executed                     |
| verification_test_tag       | no       | ""                       | Tag to be executed                              |

Dependencies
------------

 - None

Example Playbook
----------------

    - name: Run verification tests
      hosts: bastion
      roles:
      - ocp-verification-tests

License
-------

See LICENCE.txt

Author Information
------------------

Aishwarya Kamat (aishwarya.kamat@ibm.com)
