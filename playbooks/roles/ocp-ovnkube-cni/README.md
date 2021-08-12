OVNKube CNI: OCP OVN-Kubernetes Container Network Interface(CNI) Validation  
=========

#### This playbook can validate following features on OVNKube-cluster:  

- Egress IPs  
- Egress Firewall  
- Kubernetes Network Policy  
  - Network policy operations- Create, View, Update, Delete  
  - Default network policy for projects  
  - Multitenant network policy  
 
#### To-do list:  

- Multicast

Requirements
------------

 - Running OCP OVNKube 4.x cluster is needed.

Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| ocp_ovnkube_cni  | no | false  | Flag to be set to true to run this playbook  |
| ovnkube_cni_tests_enabled  | no | false  | Flag to be set to true to validate all features  |
| egressfirewall_tests_enabled  | no | false  | Flag to be set to true to validate only egressfirewall  |
| egressip_tests_enabled  | no | false  | Flag to be set to true to validate only egressip |
| networkpolicy_tests_enabled  | no | false  | Flag to be set to true to validate only networkpolicy  |

Note: Please set `ocp_ovnkube_cni` varible to true with combination with other variables to validate all CNI features or one specific CNI feature.  
Example:  

To validate all features:  
```
ocp_ovnkube_cni: true
ovnkube_cni_tests_enabled: true
```
To validate egressfirewall:  
```
ocp_ovnkube_cni: true
egressfirewall_tests_enabled: true
```

Dependencies
------------

 - None

Example Playbook
----------------

    - name: OVNKube CNI Validation
      hosts: bastion
      roles:
      - ocp-ovnkube-cni

License
-------

See LICENCE.txt

Author Information
------------------

varad.ahirwadkar@ibm.com

