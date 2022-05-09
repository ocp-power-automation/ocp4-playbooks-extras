OCP Cluster Logging and Cluster Log Forwarding
=========

This playbook is used for installing OpenShift Logging by deploying the OpenShift Elasticsearch and Red Hat OpenShift Logging Operators. 

Depending upon variables value this playbook can able to send container, infrastructure, and audit logs to specific endpoints outside your cluster. It deploys an OCP ClusterLogForwarder instance which can forward logs to the external Syslog, ElasticSearch, Kafka, Fluentd, Loki, AWS CloudWatch and to the default internal Elasticsearch log store.

It also deploys test applications to generate logs in default and project specific namespace.  

| Namespace                   | Deployments/PODs |
|-----------------------------|----------|
| default | nginx-pod-default | 
| test-logging | centos-logtest-* | 
| acme-air | acme-air* | 

Requirements
------------

 - Running OCP 4.x cluster is needed.
 - Role global-secret-update 
 - Role ocp-htpasswd-identity-provider
 - For validating the internal Kibana, it creates LDAP user `ldap_user` using HTPasswd identity provider. This can be used when `cluster_log_forwarder` and `kibana_ldap_validation` is set to true.
 - Make sure that the StorageClass resource is present on cluster for dynamically provisioned storage on demand.
 - External VM instances/systems must be configured and running (Syslog, Elasticsearch, Fluentd, Kafka, Loki, CloudWatch) 
 - Generate tls certificates in Syslog server and copy them to the bastion node. Create one secret named ***syslog-secret*** with tls certificates to connect with the external Syslog server.
```
scp -r root@<syslog_vm_ip>:/<location_of_tls_certificates> <bastion_location>
cd <bastion_locatin>
oc create secret generic syslog-secret  --from-file=tls.crt=ca.pem --from-file=tls.key=ca-key.pem --from-file=ca-bundle.crt=ca.pem  -n openshift-logging
```

 - Create one OCP secret with name ***podman-secret***  in the default namespace which is used for global secret update and has following keys:
   ***username***, ***password***  and ***registry***  

eg. `podman-secret`
```
apiVersion: v1
kind: Secret
metadata:
  name: podman-secret
type: kubernetes.io/basic-auth
stringData:
  username: admin
  password: t0p-Secret
  registry: exampe.redhat.io
```

- Create a secret that uses the ***aws_access_key_id*** and ***aws_secret_access_key*** fields to specify your base64-encoded AWS credentials in the openshift-logging namespace.
eg.
```
apiVersion: v1
kind: Secret
metadata:
  name: cw-secret
  namespace: openshift-logging
data:
  aws_access_key_id: QUtJQUlPU0ZPASE5ON0VYQU1QTEUK
  aws_secret_access_key: d0phbHJYVXRuRkVNSS9LN01QWEU5HL2JQeFJmaUNZRVhBTVBMRUtFWQo=

```
- Add this host group in the inventory file with IP addresses and passwords
```
[external_vms]
fluentd ansible_host=<ip> ansible_python_interpreter=/usr/bin/python3 ansible_connection=ssh ansible_user=root ansible_ssh_pass=<password>
syslog ansible_host=<ip> ansible_python_interpreter=/usr/bin/python3 ansible_connection=ssh ansible_user=root ansible_ssh_pass=<password>
kafka ansible_host=<ip> ansible_python_interpreter=/usr/bin/python3 ansible_connection=ssh ansible_user=root ansible_ssh_pass=<password>
```

Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| ocp_cluster_logging | yes| false  | Flag to be set to true to run this playbook  |
| cluster_log_forwarder | no | false  | Flag to be set to true to forward logs to external third-party systems and to default internal Elasticsearch log store. Logs at external system will be cleaned up automatically.  |
| elastic_search_channel | yes | ""  | It is used to set subscription channel for ElasticSearch |
| cluster_logging_channel | yes | ""  | It is used to set subscription channel for Cluster Logging |
| elasticsearch_clf_cs | no | redhat-operators  | It is used to set Index-Image of Elasticsearch in the CatalogSource |
| clusterlogging_clf_cs | no | redhat-operators  | It is used to set Index-Image of Cluster Logging in the CatalogSource |
| log_label | no| test-clf  | It is used to identify logs |
| elasticsearch_url | no |  ""  | It is used to set URL of external ElasticSearch instance. It uses insecure connection(HTTP). |
| syslog_url | no | "" | It is used to set URL of external Syslog instance. It uses secure connection (TLS). |
| fluentd_url| no | ""  | It is used to set URL of external Fluentd instance. It uses insecure connection (TCP). |
| kafka_url| no | '' | It is used to set URL of external Kafka instance. It uses insecure connection (TCP). |
| kafka_path | no | ""  | It is the path of the Kafka on external Kafka instance. (eg. /root/kafka/kafka_2.13-2.7.0/bin) |
| loki_url | no | ""  | It is used to set URL of external loki system. It uses insecure connection(HTTP)|
| cloudwatch_secret | no | aws_cw_secret | Name of the secret that uses the aws_access_key_id and aws_secret_access_key fields to specify your base64-encoded AWS credentials (HTTPS)|
| log_dir_path | no | */root/clf_logs*  | Path on bastion node to save the fetched logs from external system.|
| kibana_ldap_validation | no | false  | Set it to true for validating Kibana as LDAP user |
| log_collector_type | no | `fluentd` | Log collector type. It can be `fluentd` or `vector` |
| clf_clean_up | no | false  | It is used only for cleaning up Cluster Logging Operators, insatnces, Catalogsource, etc. from bastion. Playbook will skip remaining all other tasks.|

#### Note: 
- To send logs to particular external systems set only URL/secret varibables for that external system.
- For the internal Elasticsearch and external loki logs will not be deleted.
- ClusterLogForwarder instance always forwards logs to the default internal ElasticSearch.
- Logs of running this ansible playbook will be stored at /root/ocp_ansible_validation_log.txt
- For *kafka_url* please dot not specify topics.   
 
eg. To send logs only to Loki and CloudWatch
```
loki_url: http://loki.insecure.com:9200 
cloudwatch_secret: abc-secret
```

eg. To send logs only to the syslog 
```
syslog_url:  tls://rsyslogserver.east.example.com:514 
```
  eg.  
    
    # To set Index images set variables as:  
    elasticsearch_clf_cs: brew.registry.redhat.io/rh-osbs/iib:11111
    clusterlogging_clf_cs: brew.registry.redhat.io/rh-osbs/iib:11111

    # To use default Openshift CatalogSource:   
    elasticsearch_clf_cs: ""
    clusterlogging_clf_cs: ""
    
    # To set channels for Elasticsearch and Cluster Logging
    elastic_search_channel: "5.0"
    cluster_logging_channel: "5.0"

    # To set URL of external Kafka instance
    kafka_url: tcp://{ip}:{port}
   
#### Note: 
- Modify  *ImageContentSourcePolicy* at playbooks/roles/ocp-cluster-logging/files/ImageContentSourcePolicy.yml to change *repositoryDigestMirrors*. 
Default sources are given below:  
```
  - mirrors:
    - brew.registry.redhat.io
    source: registry.redhat.io
  - mirrors:
    - brew.registry.redhat.io
    source: registry.stage.redhat.io
  - mirrors:
    - brew.registry.redhat.io
    source: registry-proxy.engineering.redhat.com
```

Example Playbook
----------------
```
---
- name: OCP ClusterLogging and ClusterLogForwarding 
  hosts: bastion
  tasks:
  - name: Include the global-secret-update role
    include_role:
        name: global-secret-update
    when: 
      - elasticsearch_clf_cs != "" and clusterlogging_clf_cs != ""
      - elasticsearch_clf_cs != None and clusterlogging_clf_cs != None
      - clf_clean_up == false

  - name: Include the ClusterLogging and ClusterLogForwarding role
    include_role:
        name: ocp-cluster-logging
    when: clf_clean_up == false
  
  - name: Clean up Cluster Logging 
    include_tasks: "{{ playbook_dir }}/roles/ocp-cluster-logging/files/clf-cleanup.yml"
    when: clf_clean_up 
```


## License

See LICENCE.txt

## Author Information

varad.ahirwadkar@ibm.com
