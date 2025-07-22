
Openshift Data Foundation (ODF) Operator Installation
=========
This playbook is used for Installation of ODF Operator and verification of successful installation.


Requirements
------------

 - Running OCP 4.x cluster with 3 worker nodes is needed. Each worker node is expected to have a 500GB disk attached to it.
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
  registry: example.redhat.io
```
 - The Local Storage operator is installed and LocalVolumeSet is created.

Role Variables
--------------

| Variable                    | Required | Default                                    | Comments |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| odf_enabled  |yes | False| Flag to be set to true to run this playbook |
| update_channel  | no | It uses default channel | It is used to set subscription channel for ODF Operator |
| odf_catalogsource_image  | no | It uses default redhat-operators CatalogSource | It is used to set Index-Image of ODF Operator in the CatalogSource |
| test_pod_image  |no | quay.io/powercloud/nginx-unprivileged:latest| Test image to be used for operator validation |

#### Note:

- To modify  *ImageContentSourcePolicy* at playbooks\roles\ocp-odf-operator\files\ImageContentSourcePolicy.yml to change *repositoryDigestMirrors*.
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
- name: Installation of the Openshift Data Foundation Operator
  hosts: bastion
  roles:
  - ocp-odf-operator
```
License
-------

See LICENCE.txt

Author Information
------------------

sonia.garudi1@ibm.com
