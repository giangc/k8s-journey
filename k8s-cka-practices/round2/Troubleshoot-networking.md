# Concepts about pod/service networking
 **Pod and Service**
 
 **Headless service**
 - Service with `.spec.clusterIP: None`. Headless service is not handled by kube-proxy, load ballancing or proxying by the platform. DNS for headless service is entirely handled with selectors, which are either with selector or without selector.
 
# Mental model
1. How does DNS helps pod client to discover active services within cluster?
    - namespace same: `workspace1`, pod `work-pod1` can discover `work-service1`
    - namespace different: `commonspace1`, pod `common-pod1` can discover service within `workspace1`, via `common-pod1.workspace1`

2. 

# References 
- [Doc: Service](https://kubernetes.io/docs/concepts/services-networking/service/)
- [Doc: DNS for service and pod](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
