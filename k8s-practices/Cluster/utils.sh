
#Multipass k8s VM
multipass exec microk8s-vm -- sudo /snap/bin/microk8s.config > kubeconfig2

# merge kubeconfig.

#Change context
kubectl config --kubeconfig=config use-context node01
kubectl config use-context microk8s

#multipass key

