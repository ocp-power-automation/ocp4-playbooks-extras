# Extra Ansible Playbooks for OCP4

This repository consists of additional ansible playbooks for the following:

1. Run e2e tests against an existing OCP4 cluster
2. Deploy Common Services
3. Run scale tests against an existing OCP4 cluster
4. Expose OCP internal image registry
5. Run alerts configuration
6. Run OVNKube migration configuration
7. Run OVN-Kubernetes CNI Validation 

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


