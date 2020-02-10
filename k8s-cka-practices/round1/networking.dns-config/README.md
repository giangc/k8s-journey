# networking.dns-config 
- https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/
- https://kubernetes.io/docs/tasks/administer-cluster/dns-custom-nameservers/
- https://kubernetes.io/docs/tasks/administer-cluster/coredns/

 ## General learning process 
 - [x] read();
 - [x] mentalRecall();
 - [x] summaryRecall();
 - [x] mentalPracticalNote();
 - [x] readPractice() 
 - [x] practiceSummary() 
 ## Mental Note 
 - DNS Config create DNS for DNS pod and service on a Cluster, so that those DNS IP could be used by containers to resolve DNS name.
 - DNS is default feature since k8s 1.11
 - 
 ## Practical Note
- `kubectl get configmap coredns -n kube-system -o yaml`
- `kubectl apply -f coredns.yaml` # Probably need to have coredns.yaml downloaded
- `wget https://github.com/coredns/deployment/blob/master/kubernetes/deploy.sh | chmod 644 deploy.sh | ./deploy.sh`
- `kubeadm upgrade --feature-gates=CoreDNS=true`
- `kubeadm init phase addon coredns`
