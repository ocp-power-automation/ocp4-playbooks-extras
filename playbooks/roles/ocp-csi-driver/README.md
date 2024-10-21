PowerVC CSI driver Installation and Validation
=========

This role can be used for installation and validation of CSI driver in the PowerVC environment.  
Output will be stored in `csi_output.txt` at the location `csi_setup_directory`.

**Note:**
- RSCT package support is not available for Red Hat CoreOS. Run the following command on the PowerVC server to skip RMC check during volume attach or detach operations (only for the first time)
```
 powervc-config compute disable-rmc-check --enable --restart
```

Requirements
------------

- Running OCP 4.x cluster is needed.
- Cluster must not contain default StorageClass.
- Optional : 
- A secret with PowerVC certificate in the `default` namespace 
  Secret name should be `powervc-certificate` and must contains `certificate` field.
  eg. 

  ```
  apiVersion: v1
  kind: Secret
  metadata:
    name: powervc-certificate
    namespace: default
  type: Opaque
  stringData:
    certificate: |
      -----BEGIN CERTIFICATE-----
      IBAgwIBUCCAwIBAgIUn2gAbw0LWHtozBNiLdUtELvr1pyPAzcNAQYjAwDQYJKoZIhv
      ...
      Un2gAIBAb -----END CERTIFICATE-----
  ```

Role Variables
--------------

| Variable | Required | Default | Comments  |
|----------|----------|---------|-----------|
| csi_setup_directory | no | `/tmp/csi_setup_directory` |  | 
| powervc_username | yes |  | PowerVC username |
| powervc_password | yes |  | PowerVC password |
| powervc_project_name | no | `icp-test`  | PowerVC project |
| powervc_server_ip | no |  | PowerVC server IP address |
| powervc_storage_template | no | `c340f1_v7k base template`  | PowerVC storage template name |
| csi_driver_installation | no | false | Set it true for only installation of CSI driver |
| csi_driver_validation | no | false | Set it true for validating the CSI driver |
| csi_driver_clean_up | no | false | Set it true for clean up |


Dependencies
------------

- None

Example Playbook
----------------

```
---
- name: PowerVC CSI driver installation and validation
  hosts: bastion
  roles:
  - ocp-csi-driver
```

## License

See LICENCE.txt

## Author Information

varad.ahirwadkar@ibm.com
