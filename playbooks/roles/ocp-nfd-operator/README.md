Node Feature Discovery (NFD) Operator Installation
=========
This playbook is used for Installation of NFD Operator and verification of successful installation.


Requirements
------------

 - Running OCP 4.x cluster is needed.
 - Role global-secret-update.
 - Create one OCP secret with name ***podman-secret***  in the default namespace which is used for global secret update and has following keys:
   ***username***, ***password***  and ***registry***  

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

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| ocp_nfd  |yes | False| Flag to be set to true to run this playbook |
| update_channel  | no | It uses default channel | It is used to set subscription channel for NFD Operator |
| nfd_instance_image_version  | no | It uses cluster version(eg. 4.9) |This image is used while creating NFD Custom Resource |
| nfd_catalogsource  | no | It uses default redhat-operators CatalogSource | It is used to set Index-Image of NFD Operator in the CatalogSource |
| check_nxgzip_label  |no | False| set to true when using p10 server |

#### Note:

- To modify  *ImageContentSourcePolicy* at playbooks\roles\ocp-nfd-operator\files\ImageContentSourcePolicy.yml to change *repositoryDigestMirrors*. 
Default sources are given below:  
```
  - mirrors:
    - brew.registry.redhat.io
    source: registry.redhat.io
  - mirrors:
    - brew.registry.redhat.io
    source: registry.stage.redhat.io
  - mirrors:
    - brew.registry.redhat.io
    source: registry-proxy.engineering.redhat.com
```

Dependencies
------------

 - None

Example Playbook
----------------
```
---
- name: Installation of the Node Feature Discovery Operator
  hosts: bastion
  tasks:
  - name: Include the global-secret-update role
    include_role:
        name: global-secret-update
    when: catalogsource != "" and catalogsource != None

- name: Include the Node Feature Discovery Operator role
  hosts: bastion
  roles:
  - ocp-nfd-operator
```
License
-------

See LICENCE.txt

Author Information
------------------

varad.ahirwadkar@ibm.com


