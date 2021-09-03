OCP Migration & Rollback of Container Network Interface (CNI) cluster network provider
=========
This ansible playbook can be used for migration from OpenshiftSDN to OVN-Kubernetes and also for rollback to the OpenshiftSDN.

This playbook has two modules:
1. Migration
2. Rollback  

Before starting migration or rollback, playbook checks the cluster health and proceeds only if cluster is in good state.
Then it starts migration process and at the end of play it again checks cluster health. If cluster is in good state then only it removes some configuration from older network provider.  

Requirements
------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.

Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| ocp_migration  | no | false  | Flag to be set to true to run this playbook  |
| sdn_to_ovnkube  | no | false  | Flag to be set to true to migrate  |
| ovnkube_to_sdn  | no | false  | Flag to be set to true to rollback  |

eg. 
1. To migrate from OpenshiftSDN to OVNkube
```
ocp_migration: true
sdn_to_ovnkube: true
```

2. To rollback from OVNKube to OpenshiftSDN
```
ocp_migration: true
ovnkube_to_sdn: true
```
Dependencies
------------

 - None
 
Example Playbook
----------------
```
- name: OCP migration and rollback of NetworkType
  hosts: bastion
  roles:
  - ocp-migration
```
### Note:  
1. Before migration, migration playbook(sdn_to_ovnkube) takes the backup of the configuration for the cluster network to /root/cluster-openshift-sdn.yaml  

2. In the case of nodes are in NotReady, Schedulingdisabled state after running rollback playbook and playbook fails with message MCP are in updating state more than expected time... Please reboot the nodes manually . Then:   
    - Please reboot each node manually from Web console.
    - If Cluster Health is good after rebooting the nodes , Please execute following commands:  

For Rollback:
```
# oc patch Network.operator.openshift.io cluster --type='merge' --patch '{ "spec": { "migration": null } }'

# oc patch Network.operator.openshift.io cluster --type='merge' --patch '{ "spec": { "defaultNetwork": { "ovnKubernetesConfig":null } } }'

# oc delete namespace openshift-ovn-kubernetes
```
License
-------

See LICENCE.txt

Author Information
------------------

varad.ahirwadkar@ibm.com


