Global Secret Update
=========

This is a role which is created for global secret update. This can be used in different ansible playbooks or separately.   

### It performs following operations:  
- Set `disableAllDefaultSources` to true
- Get pull secret and store it in root location as /root/authfile
- Get `username` , `password` and `registry` from ocp secret named as `podman-login`
- Podman login and then set pull secret

Note:
-----
 - Only to run this role individually set `global_secret_update` to true.
 - To include this role in another playbook, please do not set `global_secret_update` to true. This role can be added directly.

Requirements
------------

 - Running OCP 4.x cluster is needed.
 - Create one OCP secret with name `podman-login`  in the default namespace and has following keys:
`username` ,`password`  and `registry`   
eg.
```
apiVersion: v1
kind: Secret
metadata:
  name: podman-login
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
| global_secret_update| no | false  | Flag to be set to true to run this playbook  |


Dependencies
------------

 - None

Example Playbook
----------------
```
---
- name: Global Secret Update
  hosts: bastion
  roles:
    - role: global-secret-update
```

## License

See LICENCE.txt

## Author Information

varad.ahirwadkar@ibm.com
