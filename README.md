# Extra Ansible Playbooks for OCP4

This repository consists of additional ansible playbooks for the following:

1. Run e2e tests against an existing OCP4 cluster
2. Deploy Common Services
3. Run scale tests against an existing OCP4 cluster
4. Expose OCP internal image registry
5. Run alerts configuration
6. Run migration and rollback of Container Network Interface (CNI) cluster network provider
7. Run OVN-Kubernetes CNI Validation 
8. Run Global Secret Update
9. Run etcd data encryption and decryption
10. Run IBM Block storage CSI (Raw block)
11. Run OCP ClusterLogForwarding Installation
12. Go Lang Installation
13. Run OCP Node Feature Discovery Operator Installation
14. Run SBO installation and running smoke acceptance tests
15. Configure HTPasswd Identity Provider
16. Set custom catalog source
17. Run Horizontal Pod Autoscaler installation and verification
18. Jenkins installation and verification
19. Vertical Pod Autoscaler installation, verification and e2e
20. Setup persistent storage using hostPath
21. PowerVC CSI driver installation and validation
22. Setup persistent storage using iSCSI
23. OC CLI-plug-ins automation testing
24. Run cluster health check

## Assumptions:

 - A healthy OpenShift 4 cluster in running state.

## Setting up inventory

Make use of sample file at `examples/inventory`.

```
cp examples/inventory .
```

**IMPORTANT**: Run the playbooks by setting either all.yaml or specific playbook/variables environment file.

## 1. Run all playbooks

#### Setting up variables

Make use of the sample file at `examples/all.yaml`. Modify the values as per your cluster.

```
cp examples/all.yaml .
```

#### Run the playbook

Once you have configured the vars & inventory file, run the playbook using:

```
ansible-playbook  -i inventory -e @all.yaml playbooks/main.yml
```

## 2. Run specific playbook

#### Setting up variables for specific playbook

Make use of the sample file at `examples/<playbook_vars.yaml>`. Modify the values as per your cluster. For more information refer to examples.

```
cp examples/<playbook_vars.yaml> .
```

Once you have configured the vars & inventory file, run the specific playbook using:

```
ansible-playbook  -i inventory -e @<playbook_vars.yaml> playbooks/main.yml
```

License
-------

See LICENCE.txt


