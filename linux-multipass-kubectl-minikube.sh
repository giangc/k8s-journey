# LINUX

## Check
# spec1 
lscpu --online --parse=Core,Socket | grep --invert-match '^#' | sort --unique | wc --lines

# spec2
grep ^cpu\\scores /proc/cpuinfo | uniq |  awk '{print $4}' 
sudo snap install microk8s --classic    

## Basic:
# Assigning and looping
nodes=$(echo number{1..10})

# Multipass
multipass exec microk8s-vm -- sudo /snap/bin/microk8s.config > kubeconfig2
multipass exec etcd-cluster -- sudo wget -q http://github.com/coreos/etcd/releases/download/v3.3.5/etcd-v3.3.5-linux-amd64.tar.gz
microk8s.status
multipass list
multipass shell <instance_name>
multipass launch --name funny-cluster
multipass launch --name master01 --cpus 2 --disk 8G
multipass launch --name worker01 --cpus 2 --disk 5G
tar -xvf
# kubectl
# Config

# Merge kubeconfig.
export KUBECONFIG=$KUBECONFIG:kubeconfig3

kubectl config view
kubectl config current-context
kubectl config get-contexts
kubectl config use-context my-cluster-name 

# Get name via -o jsonpath
jobpod1=$(kubectl get pods \
--selector=job-name=pi \
--output=jsonpath='{.items[*].metadata.name}')

kubectl get pods -l run=my-nginx -o wide

# KUBERNETES_SERVICE_HOST=10.0.0.1
# KUBERNETES_SERVICE_PORT=443
# KUBERNETES_SERVICE_PORT_HTTPS=443
kubectl exec my-nginx-3800858182-jr4a2 -- printenv | grep SERVICE
kubectl exec my-nginx-75897978cd-chhk6 -- printenv | grep SERVICE
kubectl exec -it security-context-demo-2 -- sh
kubectl exec security-context-demo-2 -- printenv
kubectl scale deployment my-nginx --replicas=0; kubectl scale deployment my-nginx --replicas=2;
kubectl get pods -l run=my-nginx -o wide
kubectl create deployment nginx --image=nginx -o yaml --dry-run
kubectl run --generator=run-pod/v1 security-context-demo --image=busybox --dry-run -o yaml > security-context-demo.yaml

## kubectl patching
kubectl patch deployment patch-demo --patch "$(cat patch-2.yaml)"
kubectl patch deployment patch-demo --patch "$(cat patch-3.yaml)"
kubectl patch deployment patch-demo --type merge --patch "$(cat patch-3.yaml)"

# minikube
minikube config #show config
minikube start --cpus 6 # start minikube and start with 6 cpus

kubeadm token create --ttl=0 --print-join-command
