OCP Jenkins
=========

This role can be used to install jenkins using template. It verifies all the resource created by the template.
Output will be stored in location specified by the variable `jenkins_directory`.

After running the playbook, need to add jenkins route in the hosts file manually.

Requirements
------------

- Templates with the persistent stoarge requires default StorageClass.

Role Variables
--------------

| Variable | Required | Default | Comments  |
|----------|----------|---------|-----------|
| jenkins_template_name | no | `jenkins-ephemeral` |  | Template name |
| jenkins_directory | no | ~/jenkins_output | Jenkins directory to store output |
| jenkins_cleanup | no | false | It is used to clean jenkins resources created by the template |

Jenkins templates: `jenkins-ephemeral`, `jenkins-ephemeral-monitored`, `jenkins-persistent`, `jenkins-persistent-monitored`

Dependencies
------------

- None

Example Playbook
----------------

```
---
- name: Installation and verification of Jenkins
  hosts: bastion
  roles:
  - ocp-jenkins
```

## License

See LICENCE.txt

## Author Information

varad.ahirwadkar@ibm.com
