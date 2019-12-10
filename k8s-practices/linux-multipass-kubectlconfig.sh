# LINUX
# Check number of CPUs
lscpu --online --parse=Core,Socket | grep --invert-match '^#' | sort --unique | wc --lines
# OR
grep ^cpu\\scores /proc/cpuinfo | uniq |  awk '{print $4}' 

# Multipass
multipass exec microk8s-vm -- sudo /snap/bin/microk8s.config > kubeconfig2

# kubectl config

# -> merge kubeconfig.
export KUBECONFIG=$KUBECONFIG:kubeconfig3
kubectl config view

# -> Change context
kubectl config --kubeconfig=config use-context node01
kubectl config use-context microk8s

# -> Check status of service
microk8s.status
