# LINUX

# spec1 
lscpu --online --parse=Core,Socket | grep --invert-match '^#' | sort --unique | wc --lines

# spec2
grep ^cpu\\scores /proc/cpuinfo | uniq |  awk '{print $4}' 
sudo snap install microk8s --classic    

## Basic
nodes=$(echo number{1..10}) # assigning and looping

  # 1. Trigger and keep till found the right one;
  # 2. Type the keyword.
  # 3. Right arrow.
echo "(i-reversed-search): Search text thru cmds history from the recent to the oldest."
echo 'Ctr + r' 
 
# Systemd
  # - Controling system service in Linux, where the basic is you can list, check status, stop, start, restart services. I.e kubelet service.
systemctl status kubelet
systemctl list | grep .service
systemctl stop | start | restart kubelet

 #  - **Useful random stuff that I saw somewhere, lol.**
 ls -ltr | tail -2: 

   #  - Long format list of all files, sorted by modification date (oldest first)
   #  - 2 last files

 tr -d "\n" #(Probbaly doing with pipelines as well... Saw a dude who used this to have and cut the private ssh key).
   -tr # text replacement
   -d  # delete
   tr -d "\n" # Text replacement(probably with the file input) with option delete all the new line char.

service kubelet status # Check service status
top    # Check usage 
df -h  # Check file system 

# --------------------- 
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

# --------------------- 
# kubectl

# Merge kubeconfig.
export KUBECONFIG=$KUBECONFIG:kubeconfig3

kubectl config view
kubectl config current-context
kubectl config get-contexts
kubectl config use-context my-cluster-name 
kubectl config view --kubeconfig=/root/my-kube-config

# Get name via -o jsonpath
jobpod1=$(kubectl get pods \
--selector=job-name=pi \
--output=jsonpath='{.items[*].metadata.name}')

kubectl get pods -l run=my-nginx -o wide
kubectl create secret tls nginxsecret --key nginx.key --cert nginx.crt
k run --generator=run-pod/v1 test-nslookup5 --image=busybox:1.28 --rm -ti -- nslookup my-nginx > output.txt

# KUBERNETES_SERVICE_HOST=10.0.0.1
# KUBERNETES_SERVICE_PORT=443
# KUBERNETES_SERVICE_PORT_HTTPS=443
kubectl exec my-nginx-3800858182-jr4a2 -- printenv | grep SERVICE
kubectl exec my-nginx-75897978cd-chhk6 -- printenv | grep SERVICE
kubectl exec -it security-context-demo-2 -- sh
kubectl exec security-context-demo-2 -- printenv
kubectl scale deployment my-nginx --replicas=0
kubectl scale deployment my-nginx --replicas=2;
kubectl get pods -l run=my-nginx -o wide
kubectl create deployment nginx --image=nginx -o yaml --dry-run
kubectl run --generator=run-pod/v1 security-context-demo --image=busybox --dry-run -o yaml > security-context-demo.yaml
kubectl run -it --rm --restart=Never alpine --image=busybox sh # run pod to test service net

## kubectl patching
kubectl patch deployment patch-demo --patch "$(cat patch-2.yaml)"
kubectl patch deployment patch-demo --patch "$(cat patch-3.yaml)"
kubectl patch deployment patch-demo --type merge --patch "$(cat patch-3.yaml)"

# --------------------- 
# minikube
minikube config #show config
minikube start --cpus 6 # start minikube and start with 6 cpus

kubeadm token create --ttl=0 --print-join-command
kubeadm token list

# ---------------------
# sl 

openssl genrsa -out ca.key 2048 # generate certificate
openssl req -new -key ca.key -subj "/CN=KUBERNETES-CA" -out ca.csr # new signing request
openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt # Self sign since it’s CA
openssl x509 -in /var/dir/some_key.crt -text # describe certificate

openssl genrsa -out nginx.key 2048 # generate certificate
openssl req -in nginx.key -out nginx.crt -subj "/CN=my-nginx/O=my-nginx"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt -subj "/CN=my-nginx/O=my-nginx"
crt=$(cat nginx.crt | base64)
key=$(cat nginx.key | base64)

ETCDCTL_API=3 etcdctl snapshot # view arguments list

ETCDCTL_API=3 etcdctl snapshot save /tmp/snapshot-pre-boot.db \
--endpoints=127.0.0.1:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key \

ETCDCTL_API=3 etcdctl member list \
--endpoints=127.0.0.1:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key \

ETCDCTL_API=3 etcdctl \
snapshot status /tmp/snapshot-pre-boot.db

ETCDCTL_API=3 etcdctl snapshot restore /tmp/snapshot-pre-boot.db \
--endpoints=127.0.0.1:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key \
--name=master \
--data-dir /var/lib/etcd-from-backup \
--initial-cluster-token=etcd-cluster-1 \
--initial-cluster=master=https://172.17.0.9:2380 \
--initial-advertise-peer-urls=https://172.17.0.9:2380

kubectl create clusterrole developer --verb=create,list,get,update,delete --resource=pods -n development
kubectl create clusterrolebinding cluster-developer --clusterrole=developer --user=john -n development
kubectl run testpod -it --rm --restart=Never --generator=run-pod/v1 --image=busybox:1.28 -- nslookup nginx-resolver-service > /root/nginx.svc