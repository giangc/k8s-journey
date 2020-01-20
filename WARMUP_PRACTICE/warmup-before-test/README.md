# Planning for the cka performance
https://github.com/cncf/curriculum/blob/master/certified_kubernetes_administrator_exam_v1.15.pdf

## Scheduling
  - **Manually schedule a pod without a scheduler**
    - **Unsearchable** Create a static pod:
      - Docs: Tasks > Config Pods and containers > Create a static pod
      - https://kubernetes.io/docs/tasks/configure-pod-container/static-pod/

      ```
      1. Create pod config file.
      2. Place it on manifest path
      3. restart service using: systemctl restart kubelet
      ```

    - Check pod scheduling status via kubectl
      `kubectl get events`
      `kubectl describe pod`

    - Manually assign nodeName to Pod
      - Docs: Tasks > Config Pods and Containers > Assign Pod to Node
      - https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/

      ```
      1. Label node
      2. Create pods and allocate it to scheduled node
      3. Create pods and allocate it to choosen node
      ```
      
      - **kubectl practice**

      ```bash 
      kubectl get nodes --show-labels
      kubectl label node minikube type=local disktype=ssd
      
      # node name
      nodeName: node01

      # nodeSelector
      nodeSelector:
        disktype: ssd
      ```

    - KodeCloud-Answer: Manually assign nodeName to Pod via REST api

  - **Understand the role of daemonset.**
    - KodeCloud-Answer: Deploy a daemonset

    - KodeCloud-Answer: View daemonsets
    
    - KodeCloud-Answer: Describe DaemonSet
    
    - Use node affinity

  - **Use label and selector to schedule pods.**
    - Label and selector for Deployment to pod
    - Label and selector for ReplicaSet to pod
    - Label and selector for Node to pod

  - **Understand how resource limit can affect Pod scheduling**
    - Setup resource request and limit for Pod
    
  - **Understand how to run multiple schedulers and how to config pod to use them**
    - **Unsearchable** Setup 3 schedulers to run 3 different pods
    - KodeCloud-Answer: Deploy a multiple scheduler
    
    - View scheduler
    - View scheduler in kube-system
    - Use custom scheduler
    - View scheduler logs

  - **Display schedule events**
    - Get events

  - **Know how to config Kubernetes Scheduler.**
    - Setup taint for node
    - Get taint status via `describe node | grep Taint`
    - Setup toleration for pod
    - Get toleration status
    - Setup label for node
    - Setup node affinity for node

## Logging/Monitoring
  - **Understand how to monitor all cluster components**
    
    - **Unsearchable** KodeCloud-Answer: Monitor cluster via Metrics Server
    - Tools: Prometheus

  - **Understand how to monitor applications**
    - **Unsearchable** KodeCloud-Answer: Container logging
  - **Manage cluster component logs**
    - Know where to find the cluster log

  - **Manage application logs**
    - Know where to find the application log

## Application Lifecycle Management
  - **Understand Deployments and how to perform rolling update and rollbacks**
    - Create frontend backend deployment
    - Expose frontend backend deployment
    - Rolling update front end backend deployment
    - Rollback frontend backend deployment
    - Get deployment
    - Rollout Status deployment
    - Rollout history deployment

  - **Know various ways to configure applications.**
    - **Unsearchable** KodeCloud-Answer: Run command and argument
    - **Unsearchable** KodeCloud-Answer: Run command and argument with `docker run -e` 
    - **Unsearchable** KodeCloud-Answer: Check container status with `docker ps -a`
    - KodeCloud-Answer: Setup environment variable
    - Create and use and view ConfigMap
    - Create and use and view Secret
    - Create and use and view ServiceAccount

  - **Know how to scale applications**
    - Scale up deployment
    - Scale down deployment
    - Autoscale deployment

  - **Understand the primitive necessary to create a self-healing application**
    - Create self-healing deployment
    - Create self-healing replicaset
    - Create self-healing DaemonSet

## Cluster Maintenance
  - **Understand Kubernetes cluster upgrade process**
    - KodeCloud-Answer: upgrade with kubeadm
      - `kubeadm upgrade plan`
      - `sudo apt-get upgrade -y kubeadm=1.12.0`
      - `sudo systemctl restart kubeadm`
      - `kubeadm upgrade apply`
      - https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/

    - **Unsearchable** KodeCloud-Answer: upgrade the hard way

  - **Facilitate operating system upgrades**
    - Drain all pods in a node:
      - `kubectl drain`

    - Cordon node: to make it unschedulable
      - `kubectl cordon`

    - Uncordon node: to make it schedulable again
      - `kubectl uncordon`

  - **Implement backup and restore methodologies**
   
    - Backup and restore Resource Configuration
      - Imperative via `kubectl get all --all-namespaces -o yaml > all-deploy-services.yaml`
      - https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/

    - Backup and restore ETCD Cluster
      - KodeCloud-Answer: save etcd snapshot. Restore: `snapshot restore /var/lib/etcd-from-backup`
      - https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/

    - Backup and restore Persistent Volume

## Security
  - **Understand Kubernetes security primitives**
    - Create node namespace
    - Create cluster-wide role and rolebinding
    - Assign cluster-wide role
    - Verify role's actions with `can-i`
      - `kubectl auth`
    - https://kubernetes.io/docs/concepts/policy/pod-security-policy/#enabling-pod-security-policies

  - **Know how to configure authentication and authorisation**
  
    - **Unsearchable**
      - KodeCloud-Answer: Authenticate user with password
      - KodeCloud-Answer: Authenticate user with user token
      - Create ServiceAccount
      - KodeCloud-Answer(0600-Security): RBAC: Create role, Get rolebinding, describe role
      - KodeCloud-Answer: Setup ABAC
      
      - Authenticating: 

      - Authorizing: 
      
  - **Know to configure network policies**
    - Task: Declare network policy:
      - https://kubernetes.io/docs/concepts/services-networking/network-policies/

  - **Create and manage TLS certificates for cluster components**
    - Boostrap cert, ca, csr

    - KodeCloud-Answer: Generate certificates
    - KodeCloud-Answer: View Certificates details the hard way
    - KodeCloud-Answer: View Certificates details with kubeadm
      - Inspect Service Log: `journalctl -u etcd.service -l`
      - `kubectl logs etcd-master -n kube-system`
      - `docker ps -a`
    - Boostrap certificate workflow
      - https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet-tls-bootstrapping/

  - **Work with images securely**
    - Use private repo image:
      - `docker login private-regis.io`
    - Use environment variable with encoded text
      - ```
        kubecte create secret docker-registry regcred \
        --docker-server=private.io \
        --docker-username=user1 \
        --docker-password=paswrd123 \
        ``` 
    
    - https://kubernetes.io/docs/concepts/containers/images/#using-a-private-registry

  - **Define security context**
    - KodeCloud-Answer: view KubeConfig with secured CA
    - KodeCloud-Answer: KubeConfig: understand name, clusters and context
      - `kubectl config view`
      - `kubectl config use-context user@production`
      - kubeConfig file
    - KodeCloud-Answer: ClusterRole and ClusterRoleBinding

  - **Secure persistent key value store**
    - Create store and retrieve value from ConfigMap
    - Create store and retrieve value from Secret
      - https://kubernetes.io/docs/concepts/configuration/secret/
    - Create store and retrieve value from etcd
    

## Storage
  - **Understand persistent volumes and know how to create them**
    - Create persistent volume
  
  - **Understand persistent volume claim primitive**
    - Create persistent volume claim
  
  - **Understand access modes for volumes**
    - ReadWriteOnce
    - ReadWriteMany
    - ReadOnlyMany
  
  - **Understand Kubernetes storage objects**
    - Create volume and mount in Pod
    - Volume type

  - **Know how to configure applications with persistent storage**
    - Sufficent Capacity
    - Access mode
    - Volume modes
    - Storage class
    - Selector
    - ReclaimPolicy

## Troubleshooting
  - **Troubleshoot application failure**
    - Know where to see application failure
    - Know how to use `kubectl logs`
    - KodeCloud-Answer: Check service status
    - KodeCloud-Answer: Check pod status

  - **Troubleshoot control plane failure**
    - Know how to use `kubectl describe` to trouble shoot service failure, node failure, pod failure in `-n kube-system`
    - Know where to look and change kube-system config
    - Know where to look and change kube-system static pods
    - Check node status
    - KodeCloud-Answer: Check controlplane services
      - `service kube-apiserver status`
      - `service kube-controller-manager status`
      - `service kube-scheduler status`
      - `service kubelet status`
      - `service kube-proxy status`
      - `sudo journalctl -u kube-apiserver`

  - **Troubleshoot worker node failure**
    - Troubleshoot config in kubelet(check kodecloud)
    - Troubleshoot config in kubeproxy(check kodecloud)
    - KodeCloud-Answer: Check node failure
    - KodeCloud-Answer: Describe node failure
      - `top`
      - `df -h`
      - `service kubelet status`
      - `sudo journalctl -u kubelet`
    - KodeCloud-Answer: Check certificates
      - KodeCloud-Answer: `openssl x509 -in /var/lib/kubelet/worker-1.crt -text`

  - **Troubleshoot networking**
    - Troubleshoot service networking config(check kodecloud)

## Core concepts
  - **Understand the kubernetes API primitives**
    - Handnote: Understand basic components
    - KodeCloud-Answer: Install etcd
    - KodeCloud-Answer: Operate etcd
    - KodeCloud-Answer: Setup etcd(check etcd.service)
    - KodeCloud-Answer: etcd in kubeadm
    - KodeCloud-Answer: etcd explore
    - KodeCloud-Answer: etcd HA cluster

  - **Understand the Kubernetes cluster architecture**
    - KodeCloud-Answer: kube-apiserver: how to view manifest file 
    - KodeCloud-Answer: kube-apiserver: how to view options with ps aux
    - KodeCloud-Answer: kube-controlmanager: how to view manifest file
    - KodeCloud-Answer: kube-controlmanager: how to view options with ps aux
    - KodeCloud-Answer: kube-scheduler: how to view manifest file
    - KodeCloud-Answer: kube-scheduler: how to view options with ps aux
    
  - **Understand Services and other network primitive**
    - Create and expose service

## Networking
  - **Prerequisite: Linux networking takeaway**
    - KodeCloud-Answer: 
      - ip link
      - ip addr
      - ip addr add 192.168.1.10/24 dev eth0
      - ip route
      - ip route add
      - cat /proc/sys/net/ipv4/ip_forward
      - arp
      - netstat -plnt

  - **Understand the networking configuration on the cluster node**
    - Setup calico
    - Check required port: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#check-required-ports
    
  - **Understand Pod networking concept**
    - KodeCloud-Answer: Note: 
      - Every pod should have IP address
      - Every pod should communicate with other pod on the same node
      - Every pod should communicate with other pod on the other nodes without NAT
    - KodeCloud-Answer: In kubelet config: 
      - `--cni-conf-dir=/etc/cni/net.d`
      - `--cni-bin-dir=/etc/cni/bin`
      - `./net-script.sh add <container> <namespace>`

  - **Understand service working**
    - Service type ClusterIP
    - Service type NodePort
    - Service type LoadBalancer
    - `cat /var/log/kube-proxy.log`
  
  - **Deploy and configure network load balancer**
    - Setup LoadBalancer node

  - **Know how to use Ingress rule**
    - Create Ingress rule
    - Join Ingress rule
    - https://kubernetes.io/docs/concepts/services-networking/ingress/

  - **Know how to configure and use the cluster DNS**
    
    - DNS
    - NS lookup, Dig utility
    - Recorded Types: A, CNAME
    - KodeCloud-Answer:
      - Setup service dns record
      - Setup service dns record within a namespace
      - Setup service dns record within a namespace, type, root
      - Setup pod dns record
    - KodeCloud-Answer: CoreDNS Config file

  - **Understand CNI**
    - KodeCloud-Answer: Config CNI in `kubelet.service`
      - ```
        --network-plugin=cni
        --cni-bin-dir
        --cni-conf-dir
       ```
    - KodeCloud-Answer: View kubelet options
      - `ps -aux | grep kubelet`
      - `ls opt/cni/bin`
      - `ls /etc/cni/net.d`
    - Deploy weavework

## Installation, Configuration and Validation
  - **Design a kubernetes cluster**
    - HA Master Nodes(3), 1 LB Master node, worker nodes

  - **Install kubernetes master and nodes**
    - Master nodes: install: kube-controller, kube-controlmanager, kube-scheduler, kubelet, kube-apiserver, kubeproxy
    - Worker nodes: install: kubelet and kubeproxy

  - **Configure secure cluster communication**
    - Boostrap TLS

  - **Configure High Availability cluster**
    - Setup HA master nodes
      - ```
        kube-controller-manager 
          --leader-elect true \
          --leader-elect-lease-duration 15s \
          --leader-elect-renew-deadline 10s \
          --leader-elect-retry-period 2s \
        ```
        - HA Cluster with kubeadm: 
          - getting-started/bootstraping cluster with kubeadm/Create HA clusters with kubeadm

  - **Know where to get the Kubernetes release binaries**
    - https://github.com/kubernetes/kubernetes/releases/

  - **Provision underlying infrastructure to deploy a Kubernetes cluster**
    - KodeCloud-Answer: Installing master node: 1 LB network, 2 Master nodes, 1 ETCD cluster

  - **Choose a network solution**
    - Weavework

  - **Choose your Kubernetes infrastructure configuration**
    - 

  - **Run end to end tests on your cluster**
    - Manual Test:
      - get nodes
      - get pods
      - get pods -n kube-system
      - service kube-apiserver status
      - service kube-controller-manager status
      
    - Run conformance test 
    - Run test

  - **Analyse end to end test result**
    - View test result

  - **Run node end to end test**
    - Run conformance test 
    - Run test
  - **Install and use kubeadm to install, configure, and manage Kubernetes cluster.**
    - kubeadm init
    - kubeadm join
    - verify kubeadm
