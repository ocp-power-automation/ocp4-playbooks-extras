OCP Service Binding Operator
=========

Service Binding manages the data plane for applications and backing services. It reads data made available by the control plane of backing services and projects the data to applications according to the rules provided via ServiceBinding resource.

#### This playbook has two modules:
1. Installation of the Service Binding Operator 
2. Running smoke acceptance tests on the Service Binding Operator and it stores the output at /root/service-binding-operator/results.txt file.

This playbook deletes previous output file, Subscription, OperatorGroup and Service Binding Operator before installing newer operator.

Requirements
--------------
- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.
- Create one OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys:
   ***username***, ***password*** and ***registry***  

eg. `podman-secret`
```
apiVersion: v1
kind: Secret
metadata:
  name: podman-secret
type: kubernetes.io/basic-auth
stringData:
  username: admin
  password: t0p-Secret
  registry: exampe.redhat.io
```

Role Variables
--------------
| Variable | Required | Default | Comments  |
|----------|----------|---------|-----------|
| sbo_catalogsource_image | no | redhat-operators | Custom catalog source index image for SBO |
| sbo_update_channel | no | stable | Update channel for SBO |
| golang_tarball_sbo | no | https://dl.google.com/go/go1.17.6.linux-ppc64le.tar.gz | HTTPS URL for golang tarball |
| acceptance_tests | no | false | Flag is used to run smoke acceptance tests |
| sbo_git_branch | no | master | Github branch used for running acceptance tests |
| sbo_cleanup | no | false | Flag is used to clean SBO resources |

Dependencies
--------------
- `set-custom-catalogsource` role is required for creating custom catalog source
- `golang-installation` role is required for running acceptance tests

Example Playbook
--------------
```
---
- name: Installation of Service Binding Operator and running smoke acceptance tests
  hosts: bastion
  tasks:
  - name: Include the global-secret-update role
    include_role:
      name: global-secret-update
    when: sbo_catalogsource != "" and sbo_catalogsource != None and sbo_cleanup == false

  - name: Include the Service Binding Operator role
    include_role:
      name: ocp-service-binding-operator
```


## License

See LICENCE.txt

## Author Information

varad.ahirwadkar@ibm.com
