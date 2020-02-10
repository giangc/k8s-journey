# networking.create-external-load-balancer 
- https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/

 ## General learning process 
 - [x] read();
 - [x] mentalRecall();
 - [x] summaryRecall();
 - [x] mentalPracticalNote();
 - [x] readPractice() 
 - [ ] practiceSummary() 

 ## Mental Note 
 - Specifying Loadbalancer type will allow cloud based solution to search for the pod when performing Load Balancer

 ## Practical Note
 - Expose deployment to service with type=LoadBalancer
  - To preserve client source IP port: 
    - healthCheckNodePort: specify node port for health checking service.
    - externalTrafficPolicy: 
        - Local 
        - Cluster