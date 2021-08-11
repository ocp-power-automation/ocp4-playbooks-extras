ocp-alerts: OCP alerts configuration
=========

This module will configure alerts on OCP and display the fired alerts

Requirements
------------

 - Running OCP 4.x cluster is needed.
 - User can provide their own alerting rules file. Reference : [Alerting Rules](https://prometheus.io/docs/prometheus/latest/configuration/alerting_rules/)

Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| file_src  | yes | ../files/alert_rule.yaml  | Path of alerts rule file  |
| file_dest  | yes  | /tmp/alert_rule.yaml  | Destination path   |

Dependencies
------------

 - None

Example Playbook
----------------

    - name: Run ocp alerts
      hosts: bastion
      roles:
      - ocp-alerts

License
-------

See LICENCE.txt

Author Information
------------------

alisha.prabhu@ibm.com

