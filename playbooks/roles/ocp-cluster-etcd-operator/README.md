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

Note -
Need to set the vars for ocp-e2e role to enable/run the e2e conformance test suite

Requirements
------------

 - Running OCP 4.x cluster # better on PowerVS

Role Variables
--------------
| Variable                       | Required | Default     | Comments                                       |
|--------------------------------|----------|-------------|------------------------------------------------|
| cluster_etcd_enabled           | no       |    false    | Set it to true to run this playbook            |
| etcd_namespace                 | no       |    false    | cluster etcd namespace.                        |
| install_acme_air               | no       |    false    | Set to true to deploy acme-air                 |
| run_e2e                        | no       |    false    | Set to true to run e2e conformance test suite  |
| install_kube_burner            | no       |    false    | Set to true to install kube-burner workload    |


Dependencies
------------

 - Role ocp-e2e  # to run e2e conformance test suite
 - Role ocp-kube-burner  #to run kubr-burner tests

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
