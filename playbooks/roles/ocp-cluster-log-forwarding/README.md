OCP Cluster Logging Deployment and Cluster Log Forwarding
=========

This playbook can be used for installing OpenShift Logging by deploying the OpenShift Elasticsearch and Red Hat OpenShift Logging Operators. With dummy cluster log forwarder it forwards audit, application and infrastructure logs to the default internal Elasticsearch log store.

Depending upon variables value this playbook can able to send container, infrastructure, and audit logs to specific endpoints outside your cluster. It deploys an OCP Cluster Log Forwarder instance which forwards logs with Syslog, ElasticSearch, Kafka and Fluentd. 

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
 - External VM instances must be configured
 - Make sure that the StorageClass resource is present on cluster for dynamically provisioned storage on demand.
 - Copy tls certificates from Syslog server instance to the bastion node to create ***syslog-secret*** and  Create one secret named ***syslog-secret*** with tls certificates for the external Syslog server.
```
scp -r root@<syslog_vm_ip>:/<location_of_tls_certificates> <bastion_location>
cd <bastion_locatin>
oc create secret generic syslog-secret  --from-file=tls.crt=ca.pem --from-file=tls.key=ca-key.pem --from-file=ca-bundle.crt=ca.pem  -n openshift-logging
```

 - Create one OCP secret with name ***podman-login***  in the default namespace which is used for global secret update and has following keys:
   ***username***, ***password***  and ***registry***  

eg. `podman-login`
```
apiVersion: v1
kind: Secret
metadata:
  name: podman-login
type: kubernetes.io/basic-auth
stringData:
  username: admin
  password: t0p-Secret
  registry: exampe.redhat.io
```

Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| ocp_cluster_log_forwarding | yes| false  | Flag to be set to true to run this playbook  |
| cluster_log_forwarder | yes | false  | Flag to be set to true to forward logs to external third-party systems otherwise it will only forward logs to default internal Elasticsearch log store |
| elastic_search_channel | yes | ""  | It is used to set subscription channel for ElasticSearch |
| cluster_logging_channel | yes | ""  | It is used to set subscription channel for Cluster Logging |
| elasticsearch_clf_cs | no | ""  | It is used to set Index-Image of Elasticsearch in the CatalogSource |
| clusterlogging_clf_cs | no | ""  | It is used to set Index-Image of Cluster Logging in the CatalogSource |
| log_label | no| test-clf  | It is used to identify logs |
| elasticsearch_url | no |  ""  | It is used to set URL of external ElasticSearch instance. It uses insecure connection(http). |
| kafka_url| no | ""  | It is used to set URL of external Kafka instance. It uses insecure connection (tcp). |
| syslog_url | no | ""  | It is used to set URL of external Syslog instance. It uses secure connection (tls). |
| fluentd_url| no | ""  | It is used to set URL of external Fluentd instance. It uses insecure connection (tcp). |

#### Note: For *kafka_url* please dot not specify topic 

  eg.  
    
    # To set Index images set variables as:  
    elasticsearch_clf_cs: brew.registry.redhat.io/rh-osbs/iib:11111
    clusterlogging_clf_cs: brew.registry.redhat.io/rh-osbs/iib:11111

    # To use default Openshift Catalog:   
    elasticsearch_clf_cs: ""
    clusterlogging_clf_cs: ""
    
    # To set channels for ElasticSearch and Cluster Logging
    elastic_search_channel: "5.0"
    cluster_logging_channel: "5.0"

    # To set URL of external Kafka instance
    kafka_url: tcp://{ip}:{port}
   
#### Note: 
- If *elasticsearch_clf_cs* and *clusterlogging_clf_cs* variables are blank then it will use default CatalogSource redhat-operators.  

- Modify  *ImageContentSourcePolicy* at playbooks/roles/ocp-cluster-logging/files/ImageSource.yml to change *repositoryDigestMirrors*. 
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
- name: OCP ClusterLogForwarding
  hosts: bastion
  tasks:
  - name: Include the global-secret-update role
    include_role:
        name: global-secret-update
    when: elasticsearch_clf_cs != "" and clusterlogging_clf_cs != ""

  - name: Include the ocp-cluster-log-forwarding role
    include_role:
        name: ocp-cluster-log-forwarding
  
```


## License

See LICENCE.txt

## Author Information

varad.ahirwadkar@ibm.com
