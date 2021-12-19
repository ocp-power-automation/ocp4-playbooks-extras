OCP Service Binding Operator
=========

Service Binding manages the data plane for applications and backing services. It reads data made available by the control plane of backing services and projects the data to applications according to the rules provided via ServiceBinding resource.

#### This playbook has two modules:
1. Installation of the Service Binding Operator 
2. Running smoke acceptance tests on the Service Binding Operator and it stores the output at /root/service-binding-operator/results.txt file.

Requirements
--------------
- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.


Role Variables
--------------
| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| ocp_sbo  | yes | false  | Flag to be set to true to run this playbook  |
| golang_tarball_sbo  | no | https://golang.org/dl/go1.16.10.linux-ppc64le.tar.gz  | HTTPS URL for golang tarball  |
| acceptance_tests  | no | false  | Flag for running smoke acceptance tests |


Dependencies
--------------
- None

Example Playbook
--------------
```
---
- name: Installation of Service Binding Operator
  hosts: bastion
  roles:
    - role: ocp-service-binding-operator
```


## License

See LICENCE.txt

## Author Information

varad.ahirwadkar@ibm.com
