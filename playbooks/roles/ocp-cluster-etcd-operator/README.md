ocp-cluster-etcd operator
=========================

The control plane hardware speed values are "Standard", "Slower", or the default, which is "".
The default setting allows the system to decide which speed to use. This value enables upgrades from versions where this feature does not exist, as the system can select values from previous versions

By selecting one of the other values, you are overriding the default. If you see many leader elections due to timeouts or missed heartbeats and your system is set to "" or "Standard", set the hardware speed to "Slower" to make the system more tolerant to the increased latency

This playbook will handle below:
- It will check the DaemonSet for HEARTBEAT_INTERVAL and LEADER_ELECTION_TIMEOUT parameters
- Change the control plane hardware speed tolerance to "Slower"
- Run the acme-air workload and e2e conformance test suite
- Also it will run the kube-burner workload test

Requirements
------------

 - Running OCP 4.x cluster # better on PowerVS

Role Variables
--------------
| Variable                       | Required | Default     | Comments                                       |
|--------------------------------|----------|-------------|------------------------------------------------|
| cluster_etcd_enabled           | no       |    false    | Set it to true to run this playbook            |
| etcd_namespace                 | no       |    false    | cluster etcd namespace.                        |
| kube_burner_repo               | no       |    false    | https://github.com/kube-burner/kube-burner.git |
| kube_burner_dir                | no       |    false    | /root/kube-burner                              |
| kube_burner_path               | no       |    false    | /root/kube-burner/examples/workloads           |


Dependencies
------------

 - Role ocp-e2e  # to run e2e conformance test suite

Example Playbook
----------------

```
  - name: Verify cluster etcd operator
    include_role:
      name: ocp-cluster-etcd-operator
```

License
-------

See LICENCE.txt

Author Information
------------------

swapnil.bobade@ibm.com
