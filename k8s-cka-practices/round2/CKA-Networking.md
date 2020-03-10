# Cluster networking
 - Cluster networking in k8s is essentially based on how nodes are connected together. It would greatly depend on how k8s cluster is architected. There are several architectures in k8s Cluster: 
   - Single master node(include etcd), multiple worker nodes.
   - Single master node, HA etcd cluster, multiple worker nodes.
   - HA master nodes, HA etcd cluster, multiple worker nodes.
   - DNS server node, HA master node, HA etcd cluster, multiple worker nodes.

 - Technical operations in setting up k8s networking consist of two steps: 
   - Provision secured public/private key value pair.
   - Choosing networking solution which support CNI.
 
# Pod/Service networking
 - Service is abstracted away the pod networking to the external world or internal system.
 - There are networking types: ClusterIP, NodePort, LoadBalancer.
   - **ClusterIP**: default type. When a pod is created, by default it has an Cluster IP address and port. Also, when a service is exposed from the pod, the service type is ClusterIP as well. This IP could be accessed by other component(e.g: Pod) of the same cluster. Networking could be restricted by NetworkPolicy, Ingress rules.
   - **NodePort**: When a service type is NodePort, its endpoint could be accessible outside the cluster.
   - **LoadBalancer**: When a service type is LoadBalancer, it is recognised to be LoadBalancer, which means it should declare cloud provider, which provide load balancer service.
