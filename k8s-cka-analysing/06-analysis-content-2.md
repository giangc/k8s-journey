> Another CKA listing based practicing before the exam take
# Planning for the cka performance
https://github.com/cncf/curriculum/blob/master/certified_kubernetes_administrator_exam_v1.15.pdf

## Scheduling
  - **Manually schedule a pod without a scheduler**
    - [x] Create a static pod:
      - Docs: Tasks > Config Pods and containers > Create a static pod
      - https://kubernetes.io/docs/tasks/configure-pod-container/static-pod/

      ```
      1. Create pod config file.
      2. Place it on manifest path
      3. restart service using: systemctl restart kubelet
      ```

    - [x] Check pod scheduling status via kubectl
      `kubectl get events`
      `kubectl describe pod`

    - [x] Manually assign nodeName to Pod
      - Docs: Tasks > Config Pods and Containers > Assign Pod to Node
      - https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/

      ```
      1. Label node

      2. Create pods and allocate it to scheduled node: E.g node that dedicated for backend deployments and services ->
        - nodeSelector.nodeName

      3. Create pods and allocate it to choosen node: E.g node that have toleration if the key and value is matched.
        - tolerations.key: xxx . value: v123. operator: Equal
      ```

      - [x] **kubectl practice**

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
    - [x] KodeCloud-Answer: Deploy a daemonset
      - Concept > Workload > Controllers > DaemonSet https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
      - Search: /en/examples/daemonset
      https://github.com/kubernetes/website/blob/master/content/en/examples/controllers/daemonset.yaml
    - [x] KodeCloud-Answer: View daemonsets
      - `kubetctl get all `
      - `kubectl get ds`
    - [x] KodeCloud-Answer: Describe DaemonSet
      - `kubectl describe ds name1`
    - [ ] Use node affinity
      - [ ] topology spread constraint
      - **Required note practice for comprehension**
      - [x] use kubectl explain to view the doc:
      `kubectl explain ds.spec.template.spec.affinity.nodeAffinity --recursive `

    - [x] Rolling Update DaemonSet
      - Tasks > Manage Daemon > update daemonset
      https://kubernetes.io/docs/tasks/manage-daemon/update-daemon-set/
    - [x] Rollback DaemonSet
      - Tasks > Manage Daemon > rollback daemonset

  - [x] **Use label and selector to schedule pods.**
    - [x] Label and selector for Deployment to pod
      - ****Github doc search****: /en/deployment
    - [x] Label and selector for ReplicaSet to pod
      - **Github doc search**: /en/replicaset
    - [x] Label and selector for Node to pod
      - **Github doc search**: /en/pod-specific-node
      `spec.nodeName: node01`

  - [x] **Understand how resource limit can affect Pod scheduling**
    - Setup resource request and limit for Pod
      - **Github doc search**: /en/cpu-request-limits
  - **Understand how to run multiple schedulers and how to config pod to use them**
    - KodeCloud-Answer: Deploy a multiple scheduler
    - View scheduler
    - Use custom scheduler
    - View scheduler in kube-system
      - `kubectl logs kube-scheduler -n kube-system`
      - `kubectl describe kube-scheduler -n kube-system`
    - View scheduler logs
      - `kubectl get events`
  - [x] **Display schedule events**
    - Get events `kubectl get events`
  - [x] **Know how to config Kubernetes Scheduler.**
    - Setup taint for node
      - `kubectl taint node node01 frontend-node:dev1:NoSchedule`
      - references > kubectl > #kubectl taint
    - Get taint status via `describe node | grep Taint`
    - Setup toleration for pod
      - **Github doc search**: /en/toleration
    - Get toleration status
      - `kubectl describe pod`
    - Setup label for node
      `kubectl label node key1:value1`
    - Setup node affinity for node
      pod.spec.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms
      - `pod.spec.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms.matchExpressions.operator` : Key relationship to set of values: In NotIn, Exists, DoesNotExist.

  **Search pattern**
    > concept > configurations > taint and toleration

## Application Lifecycle Management
  - [x] **Understand Deployments and how to perform rolling update and rollbacks**
    - [x] Rolling update deployment
      - `kubectl apply -f `
      - `kubectl set image `
    - [x] Rollback deployment
      - `kubectl apply -f `
      - `kubectl set image `
    - [x] Get deployment
      - `kubectl get deployment backend-deployment`
    - [x] Rollout Status deployment
      - `kubectl rollout status`
    - [x] Rollout history deployment
      - `kubectl rollout history`
  
  **Search pattern**
    > Concept > Workload > Controllers > Deployments

  - **Know various ways to configure applications.**
    - KodeCloud-Answer: Run command and argument
    - KodeCloud-Answer: Run command and argument with `docker run -e`
    - KodeCloud-Answer: Check container status with `docker ps -a`
    - KodeCloud-Answer: Setup environment variable
    - Create and use and view ConfigMap
    - Create and use and view Secret
    - Create and use and view ServiceAccount

  - [x] **Know how to scale applications**
    - [x] Scale up deployment
      - `kubectl scale deployment backend-deployment --replicas=3 `
    - [x] Scale down deployment
      - `kubectl scale deployment backend-deployment --replicas=1`
    - [x] Autoscale deployment
      - `kubectl autoscale deployment backend-deployment --max=5 --min 2 --cpu-percent=80`

    **Search pattern**
    > Concept > Worloads > Controllers > Deployment > #scaling-a-deployment

  - **Understand the primitive necessary to create a self-healing application**
    - [x] Create self-healing deployment
      - `deployment.spec.template.spec.restartPolicy` default to Always
      - `kubectl explain deployment.spec.template.spec.restartPolicy`
    - [x] Create self-healing replicaset
      - `deployment.spec.template.spec.restartPolicy` default to Always
      - `kubectl explain replicaset.spec.template.spec.restartPolicy`
    - [x] Create self-healing DaemonSet
      - `kubectl explain daemonset.spec.template.spec.restartPolicy`
    https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy

## Storage
  - [x] **Understand persistent volumes and know how to create them**
    - [x] Create persistent volume
      - Tasks > Configure Pod and Containers > Configure Pod to use Persistent Volume as a storage # Create Persistent Volume
      - Github: /kubernetes/examples/ >
  - [x] **Understand persistent volume claim primitive**
    - [x] Create persistent volume claim
      - Tasks > Configure Pod and Containers > Configure Pod to use Persistent Volume as a storage # Create Persistent Volume Claim
  - [x] **Understand access modes for volumes**
    - [x] ReadWriteOnce
    - [x] ReadWriteMany
    - [x] ReadOnlyMany
      - under `persistentVolume.spec.accessMode`
    - Concept > Storage > Persistent Volume # AccessMode
  - [x] **Understand Kubernetes storage objects**
    - [x] Create volume and mount in Pod
    - [x] Volume type
      - Github search: kubernetes/example > staging > example

  - **Know how to configure applications with persistent storage**
    - Sufficent Capacity
    - [x] Access mode
    - Volume modes
    - Storage class
    - Selector
    - [x] ReclaimPolicy
      - Github search: kubernetes/website > /en/reclaimpolicy
      - Docs: Concept > Storage > Persistent Volume # reclaiming
      - via kubectl -> `kubectl patch pv <your-pv-name> -p '{"spec":{"persistentVolumeReclaimPolicy":"Retain"}}'`
      - E.g `kubectl patch persistentVolume pv1 -p '{"spec": {"persistentVolumeReclaimPolicy": "Retain"}}'`

## Core concepts
  - [x] **Understand the kubernetes API primitives**
    - Handnote: Understand basic components
    - KodeCloud-Answer: Install etcd
    - KodeCloud-Answer: Operate etcd
    - KodeCloud-Answer: Setup etcd(check etcd.service)
    - KodeCloud-Answer: etcd in kubeadm
    - KodeCloud-Answer: etcd explore
    - KodeCloud-Answer: etcd HA cluster

  - [x] **Under   stand the Kubernetes cluster architecture**
    - KodeCloud-Answer: kube-apiserver: how to view manifest file
    - KodeCloud-Answer: kube-apiserver: how to view options with ps aux
    - KodeCloud-Answer: kube-controlmanager: how to view manifest file
    - KodeCloud-Answer: kube-controlmanager: how to view options with ps aux
    - KodeCloud-Answer: kube-scheduler: how to view manifest file
    - KodeCloud-Answer: kube-scheduler: how to view options with ps aux

  - [x] **Understand Services and other network primitive**
    - Create and expose service

## Security
  - **Understand Kubernetes security primitives**
    - [x] Create node namespace
      - Check verbs for api-resource: `kubectl get api-resources namespaced=true -o wide`
    - Create cluster-wide role and rolebinding
    - Assign cluster-wide role
    - Verify role's actions with `can-i`
      - `kubectl auth`
    - https://kubernetes.io/docs/concepts/policy/pod-security-policy/#enabling-pod-security-policies

  - KodeCloud-Answer: view KubeConfig with secured CA
    - KodeCloud-Answer: KubeConfig: understand name, clusters and context
      - `kubectl config view`
      - `kubectl config use-context user@production`
      - kubeConfig file
    - KodeCloud-Answer: ClusterRole and ClusterRoleBinding

  - **Know how to configure authentication and authorisation**
    - **Unsearchable**
      - KodeCloud-Answer: Authenticate user with password
      - KodeCloud-Answer: Authenticate user with user token
      - [x] Create ServiceAccount
        - `kubectl create serviceaccount backend-system --dry-run -o yaml > sa1.yaml`
      - [ ] KodeCloud-Answer(0600-Security): RBAC: Create role, Get rolebinding, describe role
      - [ ] KodeCloud-Answer: Setup ABAC
      - [ ] Authenticating:
      - [ ] Authorizing:

  - **Know to configure network policies**
    - [x] Task: Declare network policy:
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

  - [x] **Work with images securely**
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
  - [x] **Define security context**
    - [x] Understand security context is a field in Pod spec
      - `kubectl explain pod.spec.securityContext --recursive`
      - Tasks > Configure Pod and Containers > Security Context for a pod or container
  - [x] **Secure persistent key value store**
    - [x] Create store and retrieve value from ConfigMap
      - Tasks > Configure Pod or Containers > Configure pod to use Config Map
    - [x] Use Secret
      - [x] Create secret which take values from file
      - [x] Use Secret as a file and mount to a volume without exposing to a pod
      - https://kubernetes.io/docs/concepts/configuration/secret/

    - Create store and retrieve value from etcd

## Logging/Monitoring
  - **Understand how to monitor all cluster components**
    - KodeCloud-Answer: Monitor cluster via Metrics Server
    - Tools: Prometheus
  - **Understand how to monitor applications**
    - KodeCloud-Answer: Container logging
  - **Manage cluster component logs**
    - Know where to find the cluster log
  - **Manage application logs**
    - Know where to find the application log

## Cluster Maintenance
  - **Understand Kubernetes cluster upgrade process**
    - KodeCloud-Answer: upgrade with kubeadm
      - `kubeadm upgrade plan`
      - `sudo apt-get upgrade -y kubeadm=1.12.0`
      - `sudo systemctl restart kubeadm`
      - `kubeadm upgrade apply`
      - https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/
    - KodeCloud-Answer: upgrade the hard way
  - **Facilitate operating system upgrades**  
  - **Require system to test**
    - https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/
    - [ ] kubeadm upgrade process
    - [ ] manual upgrade process
    - [x] Drain all pods in a node and make that node unschedullable `kubectl drain`
    - [x] Cordon node: to make it unschedulable `kubectl cordon`
    - [x] Uncordon node: to make it schedulable again `kubectl uncordon`
  - **Implement backup and restore methodologies**
    - [x] Backup and restore Resource Configuration
      - Imperative via `kubectl get all --all-namespaces -o yaml > all-deploy-services.yaml`
      - https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/
    - [ ] Backup and restore ETCD Cluster
      - KodeCloud-Answer: save etcd snapshot. Restore: `snapshot restore /var/lib/etcd-from-backup`
      - https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/
    - Backup and restore Persistent Volume

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

  - **Run end to end tests on your cluster**
    - [x] Manual Test
      - [x] Get nodes
      - [x] Get pods
        - get pods -n kube-system
      - [x] Check k8s service status
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
