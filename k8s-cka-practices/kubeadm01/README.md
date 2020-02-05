- setup the machine
  - multipass: `multipass launch --name master01 --cpus 2 --disk 8G`  - refers to: linux-multipass-kubectl-minikube.sh

- step by step kubeadm:
  1. Install container runtime: Docker Engine.
  2. install kubectl, kubeadm
  3. Setup master node: kubeadm init
  4. Setup kubeadm following steps: 1. 2.
  5. Copy the kubeadm join token ... and join the network: kubeadm join 
  6. Install any networking solution that used CNI: Callico, Weavenet.
  7. Tear down?

1. how to check the token that are used for kubeadm join network?
  * Node authorizer: kubeadm join --token
  * create new token: `kubeadm create token --ttl=0 --print-join-command` 
  * Search pattern: kubeadm/create-cluster-kubeadm/ Search for token create
- [Joe Beda - Kubeadm intro](https://www.youtube.com/watch?v=2Yyc2R8yDRo)


