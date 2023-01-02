ocp-sctp
=========

This role is used for enabling Stream Control Transmission Protocol and running verification tests.
Results will be stored at directory specified by variable `sctp_workplace`.

Requirements
------------

 - Running OCP 4.x cluster is needed.
 - Access to the cluster as a user with the cluster-admin role

Role Variables
--------------

| Variable                | Required | Default     | Comments                                       |
|-------------------------|----------|-------------|------------------------------------------------|
| sctp_enabled            | no       | false       | Flag to be set to true to enable SCTP playbook |
| sctp_workplace          | no       | "/tmp/sctp" | Working directory for SCTP                     |
| service_type            | no       | NodePort    | Service type can be NodePort or ClusterIP      |
| sctp_verification_tests | no       | false       | Set it to true to run e2e                      |
| sctp_cleanup            | no       | true        | Flag is used to clean resources                |

Dependencies
------------

 - Role ocp-verification-tests is used to run verification tests
 - If all.yaml is being used as variable file, please set the variable `verification_feature_test` to `features/networking/sctp.feature` for ocp-verification-tests role.

Example Playbook
----------------
```
---
- name: Enabling Stream Control Transmission Protocol (SCTP) and run e2e
  hosts: bastion
  roles:
  - ocp-sctp

```

## License

See LICENCE.txt

## Author Information

varad.ahirwadkar@ibm.com
