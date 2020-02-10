# debug-failure.node 

> https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/

 ## General learning process 
- [x] read();
- [x] mentalRecall();
- [x] summaryRecall();
- [x] mentalPracticalNote();
- [x] readPractice() 
- [-] practiceSummary() 

 ## Mental Note 
  - Get nodes to check its state `kubectl get nodes`
  - Check out the log: From master node and from worker node.
    - Master node: 
        - /var/log/kube-apisever.log
        - /var/log/kube-api-controlermanager.log
        - /var/log/kube-scheduler.log
    - Worker node
        - /var/log/kubelet.log
        - /var/log/kubeproxy.log 

 ## Practical Note
