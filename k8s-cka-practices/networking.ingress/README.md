# networking.ingress 
- https://kubernetes.io/docs/concepts/services-networking/ingress/
- https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/
 ## General learning process 
 - [x] read();
 - [x] mentalRecall();
 - [x] summaryRecall();
 - [x] mentalPracticalNote();
 - [x] readPractice() 
 - [ ] practiceSummary() 
 
 ## Mental Note 
 - Ingress helps to manage external access to services in a cluster.
 - Terms: Node, cluster, edge cluster, cluster network, service
 - How does ingress handle networking routes? 
    - Ingress handles routes with rules created within the ingress.
    - Thing could be configured with ingress: TLS, load balancer, service externally reachable url

In general, working steps include: create ingress controller object, and deploy it

 ## Practical Note

- `kubectl edit ingress test`
- `kubectl describe ingress test`
