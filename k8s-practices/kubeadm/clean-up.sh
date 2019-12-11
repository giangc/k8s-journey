#!/bin/bash
multipass delete master worker1 worker2
wait $(multipass purge)
rm kubeconfig.yaml
multipass list
#sudo microk8s.
#multipass exec master -- bash -c 'sudo microk8s.kubectl get pods'
#sudo microk8s.kubectl get pods --all-namespaces