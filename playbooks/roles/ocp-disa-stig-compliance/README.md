ocp-disa-stig-compliance
========================

The Compliance Operator lets OpenShift Container Platform administrators describe the required compliance state of a cluster and provides them with an overview of gaps and ways to remediate them. The Compliance Operator assesses compliance of both the Kubernetes API resources of OpenShift Container Platform, as well as the nodes running the cluster. The Compliance Operator uses OpenSCAP, a NIST-certified tool, to scan and enforce security policies provided by the content.

This playbook installs Compliance Operator and enables: 
Various rhcos4 and ocp4 disa-stig profiles
Remediate various rules under these profiles to make them compliant, ensuring validation of these profiles for CO on Power.

Requirements
------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.
- Default StorageClass must be configured

Role Variables
--------------

Role Variables
--------------
| Variable                       | Required | Default     | Comments                                       |
|--------------------------------|----------|-------------|------------------------------------------------|
| stig_compliance_enabled        | no       |    false    | Set it to true to run this playbook            |
| compliance_catalogsource       | yes      | "redhat-operators" | Catlog source index image. default `redhat-operators` catalog source will be used |
| compliance_upgrade_channel     | yes      |    stable   | Channel version for the compliance operator    |
| rhcos4_contentfile             | yes      | "ssg-rhcos4-ds.xml" | Location of the file containing the rhcos4 compliance content |
| ocp4_contentfile               | yes      | "ssg-ocp4-ds.xml"   | Location of the file containing the ocp4 compliance content |
| content_image                  | yes      | "ghcr.io/complianceascode/k8scontent:latest" | Content image location |


Example Playbook
----------------

```
- name: Validate stig profiles
  hosts: bastion
  roles:
  - ocp-disa-stig-compliance
```

Steps to run playbook
----------------------
 
- Copy `ocp4-playbooks-extras/examples/inventory` file to the home or working directory and modify it to add a remote host
- Copy the `ocp4-playbooks-extras/examples/ocp_disa_stig_vars.yaml` to the home or working directory and set the role variables for `roles/ocp-disa-stig-compliance` with the custom inputs.
- To execute the playbook run the below sample command
 
 
Sample Command
---------------
 
ansible-playbook -i inventory -e @ocp_disa_stig_vars.yaml ~/ocp4-playbooks-extras/playbooks/ocp-disa-stig-compliance.yml

License
-------

See LICENCE.txt

Author Information
------------------

aniruddha.nayek@ibm.com
