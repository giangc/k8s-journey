kubectl config view # Show Merged kubeconfig settings.
kubectl config current-context
kubectl config get-contexts
kubectl config get-contexts

# use multiple kubeconfig files at the same time and view merged config

#Multipass k8s VM
multipass exec microk8s-vm -- sudo /snap/bin/microk8s.config > kubeconfig2

# merge kubeconfig.

#Change context
kubectl config --kubeconfig=config use-context node01
kubectl config use-context microk8s

multipass list
multipass shell <instance_name>

kubectl get pods -l run=my-nginx -o wide

# kubectl exec my-nginx-3800858182-jr4a2 -- printenv | grep SERVICE
# KUBERNETES_SERVICE_HOST=10.0.0.1
# KUBERNETES_SERVICE_PORT=443
# KUBERNETES_SERVICE_PORT_HTTPS=443
# Note there’s no mention of your Service.
#  This is because you created the replicas before the Service.
# Another disadvantage of doing this is that the scheduler might put both Pods
# on the same machine, which will take your entire Service down if it dies.
# We can do this the right way by killing the 2 Pods and waiting for the Deployment 
#to recreate them. This time around the Service exists before the replicas. 
#This will give you scheduler-level Service spreading of your Pods 
#(provided all your nodes have equal capacity),
# as well as the right environment variables:

kubectl exec my-nginx-75897978cd-chhk6 -- printenv | grep SERVICE
kubectl scale deployment my-nginx --replicas=0; kubectl scale deployment my-nginx --replicas=2;
kubectl get pods -l run=my-nginx -o wide
kubectl create deployment nginx --image=nginx -o yaml --dry-run