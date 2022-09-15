Installation of GO Language
=========

This role is used for installation of GO Language.   

Requirements
------------
 - Running OCP 4.x cluster is needed.

Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| golang_installation| yes | false  | Flag to be set to true to run this playbook  |
| golang_tarball_url| no | https://golang.org/dl/go1.16.10.linux-ppc64le.tar.gz  | HTTPS URL for golang tarball  |
| golang_installation_path| no | /usr/local/  | Path of go lang instaaltion directory  |

Note: Installation of go lang from another role can be done with the `go_tarball` and `golang_path` variables.

Dependencies
------------
 - None

Example Playbook
----------------
```
---
- name: Installatioin of GO Lang
  hosts: bastion
  roles:
    - role: golang-installation
```

## License

See LICENCE.txt

## Author Information

varad.ahirwadkar@ibm.com
