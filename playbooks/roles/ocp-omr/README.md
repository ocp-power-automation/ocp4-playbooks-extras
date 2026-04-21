ocp-omr
=========

This role enables the installation of a mirror registry for OpenShift Container Platform (OCP). 

Requirements
------------

 - PowerVM environment is required to deploy the mirror registry

Role Variables
--------------

| Variable                | Required | Default                      | Comments                                                                               |
|-------------------------|----------|------------------------------|----------------------------------------------------------------------------------------|
| enable_mirror_registry  | yes      | false                        | Flag to be set to true to enable OMR playbook                                          |
| registry_url            | no       |                              | URL of the container registry used for Podman login                                    |
| registry_username       | no       |                              | Username used to authenticate to the container registry                                |
| registry_password       | no       |                              | Password or token used for container registry authentication                           |
| quay_index_image        | no       |                              | Container image that contains the OpenShift Mirror Registry binaries                   |
| local_copy_dir          | no       | "/root/"                     | Temporary directory used to copy the mirror registry archive from the container image  |
| mirror_registry_dir     | no       | "/root/mirror-registry-dir"  | Directory where the mirror registry is installed and executed                          |
| init_password           | no       |                              | Initial password used during mirror registry installation                              |
| registry_hostname       | no       |                              | Hostname of the VM where the mirror registry is installed and accessed by OpenShift    |

Dependencies
------------

 - None

Example Playbook
----------------
```
---

- name: Installation of OMR
  hosts: bastion
  roles:
  - ocp-omr

```

## License

See LICENCE.txt

## Author Information

Vaishnavi.Dukare@ibm.com
