# etcd 
 
 ## General learning process 
 - [x] read();
 - [x] mentalRecall();
 - [x] summaryRecall();
 - [ ] mentalPracticalNote();
 - [ ] readPractice() 
 - [ ] practiceSummary() 
 
 ## Mental Note 
  ### Mental Recall
  Actionables include:
    - Setup and create etcd cluster
    - Restore data from etcd
    - Backup etcd
    - Remove failure etcd cluster
    - Secure
    - Scale
    - Restore
    - Upgrade
    - 
  
  ### Summary Recall
  Etcd Cluster needs to be configed at HA and secured cluster.
  Etcd node stores snapshot of all important information which can be used to recover the state of cluster in case of any disastrous happen.


 ## Practical Note

wget -q http://github.com/coreos/etcd/releases/download/v3.3.5/etcd-v3.3.5-linux-amd64.tar.gz

wget --no-check-certificate https://github.com/coreos/etcd/releases/download/v3.3.5/etcd-v3.3.5-linux-amd64.tar.gz
tar -xvf

etcdctl --listen-client-urls=http://1.2.3.4:2379 --advertise-client-urls=http://1.2.3.4:2379

sudo cp ca.key kubernetes-key.pem kubernetes.pem /etc/etcd/

etcdctl --cacert="etcd/ca.crt" --key=apiserver-etcd-client.key --cert=apiserver-et
cd-client.crt endpoint status

etcdctl --cacert="etcd/ca.crt" --key=apiserver-etcd-client.key --cert=apiserver-et
cd-client.crt endpoint status

etcdctl --cacert="etcd/ca.crt" --key=apiserver-etcd-client.key --cert=apiserver-et
cd-client.crt get / --prefix --keys-only

