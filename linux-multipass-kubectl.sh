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
microk8s.status
multipass list
multipass shell <instance_name>

# kubectl
# Config

# Merge kubeconfig.
export KUBECONFIG=$KUBECONFIG:kubeconfig3

kubectl config view
kubectl config current-context
kubectl config get-contexts

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
kubectl scale deployment my-nginx --replicas=0; kubectl scale deployment my-nginx --replicas=2;
kubectl get pods -l run=my-nginx -o wide
kubectl create deployment nginx --image=nginx -o yaml --dry-run