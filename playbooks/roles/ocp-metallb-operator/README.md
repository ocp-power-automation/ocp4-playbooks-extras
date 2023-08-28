ocp-metallb-operator
=========

This role is used to deploy Kubernetes MetalLB Operator and run e2e tests.

Requirements
------------

- OCP 4.x healthy cluster on PowerVS.
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys:
   ***username***, ***password*** and ***registry***

Role Variables
--------------

| Variable                                   | Required | Default                                                                              | Comments                                                                                                                       |
|--------------------------------------------|----------|--------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| metallb_enabled                            | no       | false                                                                                | Set it to true to run this playbook                                                                                            |
| metallb_install_operator                   | no       | true                                                                                 | Set it to true to install the Kubernetes MetalLB Operator                                                                      |
| metallb_enable_global_secret               | no       | true                                                                                 | Set it to true when the secret needs to be updated                                                                             |
| ocp_version                                | no       | 4.13                                                                                 | Set the proper OCP version to fetch the appropriate catalog source for MetalLB operator                                        |
| metallb_catalogsource_image                | no       | "quay.io/openshift-release-dev/ocp-release-nightly:iib-int-index-art-operators-4.13" | Custom catalog source index image for MetalLB Operator. If not defined, default `redhat-operators` catalog source will be used |
| metallb_catalogsource                      | no       | "qe-app-registry"                                                                    | Catalog source channel                                                                                                         |
| metallb_upgrade_channel                    | no       | stable                                                                               | Operator upgrade channel                                                                                                       |
| metallb_directory                          | no       | `/tmp/metallb`                                                                       | Working directory for MetalLB Operator                                                                                         |
| metallb_golang_tarball                     | no       | https://go.dev/dl/go1.18.6.linux-ppc64le.tar.gz                                      | HTTPS URL for golang tarball                                                                                                   |
| metallb_e2e                                | no       | false                                                                                | Set it to true to run e2e                                                                                                      |
| metallb_openshift_tests_private_repository | no       | https://github.com/openshift/openshift-tests-private.git                             | Github repository for openshift tests private                                                                                  |
| metallb_openshift_tests_private_git_branch | no       | master                                                                               | Git branch for the openshift repo                                                                                              |
| metallb_e2e_git_repository                 | no       | https://github.com/openshift/metallb-operator.git                                    | Git repository for e2e tests                                                                                                   |
| metallb_e2e_git_branch                     | no       | main                                                                                 | Git branch for e2e                                                                                                             |
| metallb_cleanup                            | no       | true                                                                                 | Flag is used to clean MetalLB Operator resources                                                                               |
| metallb_frr_ver                            | no       | frr-8                                                                                | Frr version to be installed                                                                                                    |
| metallb_frr_rpm                            | no       | https://rpm.frrouting.org/repo/frr-8-repo-1-0.el9.noarch.rpm                         | Frr repo to fetch the rpm                                                                                                      |
| metallb_test_image                         | no       | quay.io/openshifttest/hello-openshift:1.2.0                                          | Test image to deploy sample pod                                                                                                |
| l2_address                                 | yes      |                                                                                      | 2 IPV4 addresses for creating Layer 2 address pool                                                                             |
| bgp_address                                | yes      |                                                                                      | 1 IPV4 address for creating BGP address pool                                                                                   |

Environment Variables
---------------------

| Variable             | Required       | Comments                                                                |
|----------------------|----------------|--------------------------------------------                             |
| GITHUB_USERNAME      | yes            | Public GitHub account username to which the repository access granted.  |
| GITHUB_ACCESS_TOKEN  | yes            | GitHub personal access token to clone the repository.                   |

Dependencies
------------

- None

Example Playbook
----------------
```
---
- name: Installation of the MetalLB Operator and run e2e
  hosts: bastion
  tasks:
  - name: Deploy MetalLB Operator
    include_role:
      name: ocp-metallb-operator
```

License
-------

See LICENCE.txt

Author Information
------------------

shilpa.gokul@ibm.com
