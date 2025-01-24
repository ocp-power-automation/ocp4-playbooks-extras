ocp-ingress-firewall-operator
=========

This role is used to deploy Ingress Firewall Operator in a OCP cluster .

This playbook has two modules:
Installation of the Ingress Firewall Operator.
Running the end to end tests for Ingress Firewall Operator.

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
| ingress_enabled             | no       |    false    | Set it to true to run this playbook            |
| ingress_directory           | no       | `/tmp/ingress` | Working directory for ingress operator         |
| ingress_catalogsource_image | no       |             | Catlog source index image.  |
| ingress_catalogsource_name | no       |             | Catlog source index name.  |
| ingress_namespace | no       |             | Namespace for deploying ingress operator |
| ingress_e2e                 | no       |    false    | Set it true for running e2e tests              |
| ingress_e2e_github_repo     | no       |     ""      | github repository for running e2e tests        |
| ingress_e2e_github_branch   | no       |    master   | github repository branch for running e2e tests |
| ingress_go_tarball          | no       | https://go.dev/dl/go1.22.4.linux-ppc64le.tar.gz | HTTPS URL for golang tarball |
| ingress_github_username     | no       |     ""      | Github username                                |
| ingress_github_token        | no       |     ""      | Github token                                   |

Dependencies
------------

- To run e2e test cases, it requires access to the openshift-test-private repository.

Example Playbook
----------------

```
  - name: Deploy ingress firewall operator in OpenShift
    include_role:
      name: ocp-ingress-firewall-operator
```

License
-------

See LICENCE.txt

Author Information
------------------

yashansh.sharma@ibm.com