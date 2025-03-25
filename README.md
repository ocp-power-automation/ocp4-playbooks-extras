# Extra Ansible Playbooks for OCP4

This repository consists of additional ansible playbooks for the following:

1. Run e2e tests against an existing OCP4 cluster
1. Run scale tests against an existing OCP4 cluster
1. Expose OCP internal image registry
1. Run alerts configuration
1. Run migration and rollback of Container Network Interface (CNI) cluster network provider
1. Run OVN-Kubernetes CNI Validation 
1. Run Global Secret Update
1. Run etcd data encryption and decryption
1. Run IBM Block storage CSI (Raw block)
1. Run OCP ClusterLogForwarding Installation
1. Go Lang Installation
1. Run OCP Node Feature Discovery Operator Installation
1. Run SBO installation and running smoke acceptance tests
1. Configure HTPasswd Identity Provider
1. Set custom catalog source
1. Run Horizontal Pod Autoscaler installation and verification
1. Jenkins installation and verification
1. Vertical Pod Autoscaler installation, verification and e2e
1. Setup persistent storage using hostPath
1. PowerVC CSI driver installation and validation
1. Setup persistent storage using iSCSI
1. OC CLI-plug-ins automation testing
1. Run cluster health check
1. Run Compliance Operator installation and e2e 
1. Hypershift deployment on PowerVS
1. Run File Integrity Operator and e2e
1. Configure and test IPA identity provider
1. Enable monitoring for user-defined projects
1. Configure and test Request-Header identity provider
1. Descheduler deployment and running e2e test
1. Configure and run verification-tests
1. Enabling Stream Control Transmission Protocol (SCTP) and run e2e
1. Deploy Kubernetes NMState Operator and run e2e
1. Enable pod disruption budget (pdb)
1. Scheduler profile configuration and run e2e tests
1. Cluster Resource Override Operator deployment and e2e test run
1. Deploy MetalLB operator and run e2e
1. Hypershift Agent based installation
1. Deploy Local Storage Operator
1. Deploy Secondary Scheduler Operator and run e2e
1. Test development of ansible, helm and go operator using operator-sdk
1. Cluster ETCD operator, Workload and e2e test run
1. Kube burner workload
1. Validate Scheduler-Plugins
1. Deploy Ingress Firewall Operator and run e2e.
1. Validate CPU manager feature and run e2e.

## Assumptions:

 - A healthy OpenShift 4 cluster in running state.

## Setting up inventory

Make use of sample file at `examples/inventory`.

```
cp examples/inventory .
```

## Run the playbooks

Run all playbooks at once or specific playbook as shown below.

### Run all playbooks

To set up variables make use of the sample file at `examples/all.yaml`. Modify the values as per your cluster.

```
cp examples/all.yaml .
```

Once you have configured the vars & inventory file, run the playbook using:

```
ansible-playbook  -i inventory -e @all.yaml playbooks/main.yml
```

### Run specific playbook

To set up variables for specific playbook make use of the sample file at `examples/<playbook_vars.yaml>`. Modify the values as per your cluster. For more information refer to examples.

```
cp examples/<playbook_vars.yaml> .
```

Once you have configured the vars & inventory file, run the specific playbook using:

```
ansible-playbook  -i inventory -e @<playbook_vars.yaml> playbooks/main.yml
```

**Note:**  
The Ansible playbook fails when a role requires the `make` module or when running all playbooks using `playbooks/main.yaml`, as described in [Issue 42](https://github.com/ocp-power-automation/ocp4-playbooks-extras/issues/42). 

Install collection community.general:
```
ansible-galaxy collection install community.general
```

License
-------

See LICENCE.txt


