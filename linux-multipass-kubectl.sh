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

# kubectl
# Config

# Merge kubeconfig.
export KUBECONFIG=$KUBECONFIG:kubeconfig3
kubectl config view

# Change context
kubectl config --kubeconfig=config use-context node01
kubectl config use-context microk8s

# Check status of service
microk8s.status

# Get name via -o jsonpath
jobpod1=$(kubectl get pods \
--selector=job-name=pi \
--output=jsonpath='{.items[*].metadata.name}')

