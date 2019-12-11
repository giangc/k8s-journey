## kubeadm 
Following [arashkaffamanesh/kubeadm-multipass](https://github.com/arashkaffamanesh/kubeadm-multipass)


## Mental Note 

### Technical handling
Use kubeadm to faciliate kubernetes, including:
  - kubeadm installations and config: 
    - Container runtime: containerd K8s 
    - Networking: CNI, Docker network(overlay2).
    - K8s essentials: kubelet, kubectl(microk8s in multipass), 
    - Node provisioning config: cpus,  mem, etc. *(not sure if provisioning is the right word)*
  - Architecture: Master nodes - Worker nodes
  - Progressive rollout on Callico
  - Worker nodes joining: container runtime, kubelet, etc.
  - 

### Workflow management
  - Basic structure how to manage a shell config projects.
  - Bunch of linux stuff:
    - [TBD - Could not get loop in function working](https://stackoverflow.com/questions/22863783/bash-script-cant-get-for-loop-working)

## Practical Note

- deploy-kubeadm-matser.sh
```
cat <<EOF > 1-deploy-kubeadm-matser.sh
#!/bin/bash
multipass launch ubuntu --name master --cpus 2 --disk 8G
multipass exec master -- bash -c 'wget https://packages.cloud.google.com/apt/doc/apt-key.gpg'
multipass exec master -- bash -c 'sudo apt-key add apt-key.gpg'
multipass exec master -- bash -c 'sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"'
multipass exec master -- bash -c 'sudo apt-get update && apt-get install -y apt-transport-https'
multipass exec master -- bash -c 'curl https://releases.rancher.com/install-docker/18.09.sh | sh'
# Setup daemon.
multipass transfer daemon.json master:
multipass exec master -- bash -c 'sudo cp /home/ubuntu/daemon.json /etc/docker/daemon.json'
multipass exec master -- bash -c 'sudo mkdir -p /etc/systemd/system/docker.service.d'
# Restart docker.
multipass exec master -- bash -c 'sudo systemctl daemon-reload'
multipass exec master -- bash -c 'sudo systemctl restart docker'
multipass exec master -- bash -c 'sudo usermod -aG docker multipass'
multipass exec master -- bash -c 'sudo apt-get install -y kubelet kubeadm kubectl'
multipass exec master -- bash -c 'sudo apt-mark hold kubelet kubeadm kubectl'
multipass exec master -- bash -c 'sudo swapoff -a'
multipass exec master -- bash -c  "sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab"
multipass exec master -- bash -c 'sudo sysctl net.bridge.bridge-nf-call-iptables=1'
multipass exec master -- bash -c 'sudo kubeadm init --pod-network-cidr=192.178.0.0/16'
multipass exec master -- bash -c 'sudo cat /etc/kubernetes/admin.conf' > kubeconfig.yaml
KUBECONFIG=kubeconfig.yaml
kubectl apply -f https://docs.projectcalico.org/v3.9/manifests/calico.yaml
# kubectl apply -f calico.yaml
kubectl rollout status daemonset calico-node -n kube-system
kubectl get nodes -o wide
echo "Enjoy the kubeadm made Kubernetes 1.6.x on Multipass"
echo "Now deploying the worker nodes"
EOF
```

- deploy-nodes.sh

```
 multipass launch --name master --mem 2G --disk 4G
```

- Init k8s: `multipass exec master -- bash -c 'sudo kubeadm init --pod-network-cidr=192.178.0.0/16'` -> Init k8s sample result log ...

```
W1211 14:42:12.819764    7467 validation.go:28] Cannot validate kube-proxy config - no validator is available
W1211 14:42:12.819856    7467 validation.go:28] Cannot validate kubelet config - no validator is available
[init] Using Kubernetes version: v1.17.0
[preflight] Running pre-flight checks
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
[kubelet-start] Starting the kubelet
[certs] Using certificateDir folder "/etc/kubernetes/pki"
[certs] Generating "ca" certificate and key
[certs] Generating "apiserver" certificate and key
[certs] apiserver serving cert is signed for DNS names [master kubernetes kubernetes.default kubernetes.default.svc kubernetes.default.svc.cluster.local] and IPs [10.96.0.1 192.168.64.9]
[certs] Generating "apiserver-kubelet-client" certificate and key
[certs] Generating "front-proxy-ca" certificate and key
[certs] Generating "front-proxy-client" certificate and key
[certs] Generating "etcd/ca" certificate and key
[certs] Generating "etcd/server" certificate and key
[certs] etcd/server serving cert is signed for DNS names [master localhost] and IPs [192.168.64.9 127.0.0.1 ::1]
[certs] Generating "etcd/peer" certificate and key
[certs] etcd/peer serving cert is signed for DNS names [master localhost] and IPs [192.168.64.9 127.0.0.1 ::1]
[certs] Generating "etcd/healthcheck-client" certificate and key
[certs] Generating "apiserver-etcd-client" certificate and key
[certs] Generating "sa" key and public key
[kubeconfig] Using kubeconfig folder "/etc/kubernetes"
[kubeconfig] Writing "admin.conf" kubeconfig file
[kubeconfig] Writing "kubelet.conf" kubeconfig file
[kubeconfig] Writing "controller-manager.conf" kubeconfig file
[kubeconfig] Writing "scheduler.conf" kubeconfig file
[control-plane] Using manifest folder "/etc/kubernetes/manifests"
[control-plane] Creating static Pod manifest for "kube-apiserver"
[control-plane] Creating static Pod manifest for "kube-controller-manager"
W1211 14:43:30.653149    7467 manifests.go:214] the default kube-apiserver authorization-mode is "Node,RBAC"; using "Node,RBAC"
[control-plane] Creating static Pod manifest for "kube-scheduler"
W1211 14:43:30.654632    7467 manifests.go:214] the default kube-apiserver authorization-mode is "Node,RBAC"; using "Node,RBAC"
[etcd] Creating static Pod manifest for local etcd in "/etc/kubernetes/manifests"
[wait-control-plane] Waiting for the kubelet to boot up the control plane as static Pods from directory "/etc/kubernetes/manifests". This can take up to 4m0s
[apiclient] All control plane components are healthy after 24.020598 seconds
[upload-config] Storing the configuration used in ConfigMap "kubeadm-config" in the "kube-system" Namespace
[kubelet] Creating a ConfigMap "kubelet-config-1.17" in namespace kube-system with the configuration for the kubelets in the cluster
[upload-certs] Skipping phase. Please see --upload-certs
[mark-control-plane] Marking the node master as control-plane by adding the label "node-role.kubernetes.io/master=''"
[mark-control-plane] Marking the node master as control-plane by adding the taints [node-role.kubernetes.io/master:NoSchedule]
[bootstrap-token] Using token: x1ec1a.1cgjlvwonf3sst59
[bootstrap-token] Configuring bootstrap tokens, cluster-info ConfigMap, RBAC Roles
[bootstrap-token] configured RBAC rules to allow Node Bootstrap tokens to post CSRs in order for nodes to get long term certificate credentials
[bootstrap-token] configured RBAC rules to allow the csrapprover controller automatically approve CSRs from a Node Bootstrap Token
[bootstrap-token] configured RBAC rules to allow certificate rotation for all node client certificates in the cluster
[bootstrap-token] Creating the "cluster-info" ConfigMap in the "kube-public" namespace
[kubelet-finalize] Updating "/etc/kubernetes/kubelet.conf" to point to a rotatable kubelet client certificate and key
[addons] Applied essential addon: CoreDNS
[addons] Applied essential addon: kube-proxy

Your Kubernetes control-plane has initialized successfully!

```

```To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 192.168.64.9:6443 --token x1ec1a.1cgjlvwonf3sst59 \
    --discovery-token-ca-cert-hash sha256:9b22313706b29ba6649289c76e255a11a5c7ad60d97edd58fc74fa4c10c2d0b6 ```


- Install Docker container runtime - Containerd - Config daemon.json
 > [k8s doc: setup/cri](https://v1-12.docs.kubernetes.io/docs/setup/cri/)

- Sample daemon.json
```
cat <<EOF > daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
```

- Creating 2 worker nodes ...
```
!/bin/bash
 for NODE in ${NODES}; 
 do multipass launch ubuntu --name ${NODE} --cpus 2 --mem 2G --disk 8G; 
 done;

NODES=$(echo worker{1..2})
for NODE in ${NODES}; do
multipass transfer install_tools.sh ${NODE}:
multipass exec ${NODE} -- bash -c 'cd $HOME'
multipass exec ${NODE} -- bash -c 'sudo chmod +x ./install_tools.sh'
multipass exec ${NODE} -- bash -c './install_tools.sh install_tools'
multipass exec ${NODE} -- bash -c './install_tools.sh download_containerd_tarball'
multipass exec ${NODE} -- bash -c './install_tools.sh verify_checksum'
multipass exec ${NODE} -- bash -c './install_tools.sh setup_containerd'
multipass exec ${NODE} -- bash -c './install_tools.sh create_containerd_kubelet_conf'
multipass exec ${NODE} -- bash -c 'sudo swapoff -a'
multipass exec ${NODE} -- bash -c  "sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab"
multipass exec ${NODE} -- bash -c  'sudo modprobe br_netfilter'
multipass exec ${NODE} -- bash -c 'sudo sysctl net.bridge.bridge-nf-call-iptables=1'
multipass exec ${NODE} -- bash -c 'sudo echo 1 |  sudo tee  /proc/sys/net/ipv4/ip_forward'
done

echo "Now running kubeadm join nodes"
echo "We're ready soon :-)"
echo "© 2019 GitHub, Inc."
```

- Joining 2 worker nodes ...
``` 
cat <<EOF > join-nodes.sh
#!/bin/bash
NODES=$(echo worker{1..2})

for NODE in ${NODES}; do
multipass exec ${NODE} -- bash -c "sudo mkdir -p /home/ubuntu/.kube/"
multipass exec ${NODE} -- bash -c "sudo chown ubuntu:ubuntu /home/ubuntu/.kube/"
multipass transfer kubeconfig.yaml ${NODE}:/home/ubuntu/.kube/config
multipass exec ${NODE} -- bash -c "sudo kubeadm token create --print-join-command >> kubeadm_join_cmd.sh"
multipass exec ${NODE} -- bash -c "sudo chmod +x kubeadm_join_cmd.sh"
multipass exec ${NODE} -- bash -c "sudo sh ./kubeadm_join_cmd.sh"
done
sleep 30
KUBECONFIG=kubeconfig.yaml
kubectl label node worker1 node-role.kubernetes.io/node=
kubectl label node worker2 node-role.kubernetes.io/node=
kubectl get nodes

echo "############################################################################"
echo "Enjoy :-)"
EOF
``` 
- Sample output:

```
W1211 16:02:37.517826    9550 join.go:346] [preflight] WARNING: JoinControlPane.controlPlane settings will be ignored when control-plane flag is not set.
[preflight] Running pre-flight checks
[preflight] Reading configuration from the cluster...
[preflight] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -oyaml'
[kubelet-start] Downloading configuration for the kubelet from the "kubelet-config-1.17" ConfigMap in the kube-system namespace
[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Starting the kubelet
[kubelet-start] Waiting for the kubelet to perform the TLS Bootstrap...

This node has joined the cluster:
* Certificate signing request was sent to apiserver and a response was received.
* The Kubelet was informed of the new secure connection details.

Run 'kubectl get nodes' on the control-plane to see this node join the cluster.
```

- Install microk8s via snap

## QA
  - How do I recover unknown state of multipass? 
  > 0.8 is out of dated. Upgrade to 0.9
  - In the step of creating a worker node, explain?
  
