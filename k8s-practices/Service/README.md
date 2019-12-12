## Service 
[kubernetes.io - Concept : Basic understanding of Service](https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/)

## Mental Note
 - Connecting the application to Service, includes:
   - Defines container port.
   - Expose service to Cluster level or outside.
   - 2 types of IP: accessible in Cluster or accessible outside.
   - Accessible outside include Service types: NodePort or LoadBalancer.
   - Service type will be assigned to Nodes automatically.
   - Secure your service by:
    - Create https certificates
    - Use Secrets to store the certificate to certificate can be accessible by pods
    - Config pod using certificate(yaml)
   - Access to CoreDNS(enabled by default)
   
## Practical Note


## References: 
- https://github.com/kubernetes/examples/tree/master/staging/https-nginx/

## QA
