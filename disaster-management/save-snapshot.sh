#!/bin/bash

# for explaination use-link: https://rancher.com/blog/2019/2019-01-29-what-is-etcd/
# sudo snap install etcdctl --classic

# ex. loadBalancerIP="34.121.90.45"

# [Disaster recovery by etcd-backup]
ks apply -f disaster-management/storage-class.yaml
ks apply -f disaster-management/etcd-sts.yaml

# update current loadbalancerIP 
ETCDCTL_API=3 etcdctl --endpoints=<loadBalancerIP>:2379 snapshot save snapshot.db
# kubectl cp etcd-0:snapshot.db --container etcd snapshot.db 
