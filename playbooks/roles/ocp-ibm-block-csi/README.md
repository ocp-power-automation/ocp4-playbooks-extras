ocp-ibm-block-csi: OCP IBM raw block
=========

This module will configure ibm raw block 

Requirements
------------

 - Running OCP 4.x cluster is needed.
 - User can create secret file and create and apply the storage classes
 - User can create pvc for volume with file system.

Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| management_adress:  |yes | | ip adress of storage management server |
| username:  |yes | | username to access storage management server |
| password:  |yes | | password to access storage management server |
| iSCSI_setup_dir:  |yes | ~/setup-files/iSCSI_setup_dir |
| file_src_99_ibm_attach:  |yes | ../files/99-ibm-attach.yaml |  Path of ibm configration file  |
| file_dest_99_ibm_attach  |yes | /tmp/99-ibm-attach.yaml | Destination path |

Dependencies
------------

 - None

Example Playbook
----------------

    - name: ocp-ibm-block-csi
      hosts: bastion
      roles:
      - ocp-ibm-block-csi

License
-------

See LICENCE.txt

Author Information
------------------

amey.shikerkar1@ibm.com


