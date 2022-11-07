ocp-compliance
=========

The Compliance Operator lets OpenShift Container Platform administrators describe the required compliance state of a cluster and provides them with an overview of gaps and ways to remediate them. The Compliance Operator assesses compliance of both the Kubernetes API resources of OpenShift Container Platform, as well as the nodes running the cluster. The Compliance Operator uses OpenSCAP, a NIST-certified tool, to scan and enforce security policies provided by the content.

This playbook has two modules:
Installation of the Compliance Operator and oc-compliance plugin.
Running the end to end tests for Compliance operator with CIS profiles and oc-compliance plugin.

Requirements
------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys: ***username***, ***password*** and ***registry***

Role Variables
--------------

Role Variables
--------------
| Variable                       | Required | Default     | Comments                                       |
|--------------------------------|----------|-------------|------------------------------------------------|
| compliance_enabled             | no       |    false    | Set it to true to run this playbook            |
| compliance_directory           | no       | `/tmp/compliance` | Working directory for compliance         |
| compliance_catalogsource_image | no       |             | Catlog source index image. If not defined, default `redhat-operators` catalog source will be used |
| compliance_upgrade_channel     | no       | release-0.1 | Channel version for the compliance operator    |
| compliance_e2e                 | no       |    false    | Set it true for running e2e tests              |
| compliance_e2e_github_repo     | no       |     ""      | github repository for running e2e tests        |
| compliance_e2e_github_branch   | no       |    master   | github repository branch for running e2e tests |
| compliance_github_username     | no       |     ""      | Github username                                |
| compliance_github_token        | no       |     ""      | Github token                                   |
| compliance_cleanup             | no       |    true     | Uninstall and cleanup any existing installed version of compliance operator |

Dependencies
------------

- To run e2e test cases, it requires access to the openshift-test-private repository.

Example Playbook
----------------

```
  - name: Deploy Compliance Operator
    include_role:
      name: ocp-compliance
```

License
-------

See LICENCE.txt

Author Information
------------------

varad.ahirwadkar@ibm.com
