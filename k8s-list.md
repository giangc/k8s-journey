# List of online practices that I went thru for later process of reflection.

- [CURRICULUM LINKS](https://github.com/cncf/curriculum/blob/master/certified_kubernetes_administrator_exam_v1.15.pdf)

### General tips:
1. How can I craft the complex K8s component in yaml?
  > Basically just create everything imperatively, using kubectl run --dry-run and output it into a yaml file. Then we can start it from there.

2. General practices that could cover most of the content of the CKA?
  > Setup cluster architecture: cluster in install, config, inspect, etc. Networking: cluster to cluster
  > Stateful App, Stateless App: 
    - General topics: Networking, Security(AppAmor), Scheduler, Monitoring(probably prometheus, grafana, etc.), CICD setup(Docker hub, Helm, etc.)
    - K8s component: Node, Pod, Service, kubescheduler, etcd, PV, PVC, StorageName.

3. What I never covered?
  > Test??? e2e node test.
  
### Messy practices

- [katacoda-boxboat: Deployment](https://www.katacoda.com/boxboat/courses/kubernetes-basic/module-4)

- [katacoda-contino: Deployment](https://www.katacoda.com/contino/courses/kubernetes/basic-deployments)

- [katacoda-boxboat: Monitoring with Prometheus](https://www.katacoda.com/boxboat/courses/kubernetes-basic/module-6)

- [katacoda-contino: Pods and namespace](https://www.katacoda.com/contino/courses/kubernetes/pods)

- [digital-ocean: Use kubeadm to create a cluster](https://www.digitalocean.com/community/tutorials/how-to-create-a-kubernetes-cluster-using-kubeadm-on-ubuntu-16-04)
- [digital-ocean: Overview in learning k8s](https://dev.to/digitalocean/closing-the-kubernetes-skills-gap-with-developer-first-learning-5aa7)
- [digital-ocean: K8s for fullstack developer](https://www.digitalocean.com/community/curriculums/kubernetes-for-full-stack-developers#2.Containers,ModernizingApplicationsand12FactorDevelopment)

### High availability cluster
- [kubedoc-tasks: setup high k8s cluster master](https://kubernetes.io/docs/tasks/administer-cluster/highly-available-master/)

- (https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/)

### Application
- Setup
- Deploy
- Run:
    - (https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/)
    - (https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/)
    - (https://kubernetes.io/docs/tasks/administer-cluster/highly-available-master/)
    - (https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/setup-ha-etcd-with-kubeadm/)

- Scale

- Stateless Application
    - [doc-tutorial](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/)

- Stateful Application
    - [doc-tutorial](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/)

- Secrets:
    [doc-concept](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/)
- https://www.digitalocean.com/community/tutorials/how-to-create-a-kubernetes-cluster-using-kubeadm-on-ubuntu-16-04
- https://www.digitalocean.com/community/curriculums/kubernetes-for-full-stack-developers#2.Containers,ModernizingApplicationsand12FactorDevelopment
- https://www.digitalocean.com/community/tutorials/modernizing-applications-for-kubernetes
- https://www.digitalocean.com/community/tutorials/how-to-deploy-a-php-application-with-kubernetes-on-ubuntu-18-04
- https://www.digitalocean.com/community/tutorials/an-introduction-to-service-meshes
- https://www.digitalocean.com/community/tutorials/how-to-inspect-kubernetes-networking
- https://www.digitalocean.com/community/tutorials/kubernetes-networking-under-the-hood

- Cluster scheduling system:
  - Borg
  - Marathon
  - Aurora
  - Tupperware

### Docs references
- https://prometheus.io/docs/introduction/overview/
- https://prometheus.io/docs/concepts/data_model/#samples
- https://prometheus.io/docs/prometheus/latest/querying/basics/
- https://hub.helm.sh/
- https://helm.sh/

- [katacoda-playground: 1 master and 1 worker](https://www.katacoda.com/courses/kubernetes/playground)

- [github-community: e2e node test](https://github.com/kubernetes/kubernetes/tree/master/test/e2e/node)

- [Kubectl-docs](https://kubectl.docs.kubernetes.io/) : Lots of good info on how to manage k8s config by cmd and how to manage them by structure.

- [x] [MS - How kube-scheduler work | length: 8 mins](https://www.youtube.com/watch?v=rDCWxkvPlAw)

- [x] [VMware - Grokking kube scheduler | length: 1h 24 mins](https://www.youtube.com/watch?v=XxVHNWoZO_c&t=265s)

- [Setup and config kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/#pod-network)

- [x] [Great example on kubeadm in local multipass](https://github.com/arashkaffamanesh/kubeadm-multipass)
- [ ] [Vmware: Kubectl explain](https://blog.heptio.com/kubectl-explain-heptioprotip-ee883992a243)
## Public tutorial images
- - name: redis  image: redis:4.0.10
- - name: nginx  image: nginx

## research-online-about-certificate()

- [x] [platformer.com: How I pass CKAs](https://medium.com/platformer-blog/how-i-passed-the-cka-certified-kubernetes-administrator-exam-8943aa24d71d)
  - Can access anything under kubernetes.io domain:
    - kubectl cheatsheet
    - Discussion forum
    - Documentation
  - kubectl explain resource.key

- [CKA: walidshaari](https://github.com/walidshaari/Kubernetes-Certified-Administrator)

- [CKAD: Small practices](https://medium.com/bb-tutorials-and-thoughts/practice-enough-with-these-questions-for-the-ckad-exam-2f42d1228552)

- [CKAD: dgkanatsios](https://github.com/dgkanatsios/CKAD-exercises/blob/master/)

- [CKAD: Practice-Questions](https://github.com/bbachi/CKAD-Practice-Questions)

- [x] [kubernetes-the-hard-way](https://github.com/kelseyhightower/kubernetes-the-hard-way/)

- [Just another list](https://goo.gl/Rywkpd) : Should kinda review the list ...

- http://www.kubernet.io/

- https://dzone.com/articles/preparing-for-the-certified-kubernetes-administrat

- https://training.play-with-kubernetes.com/kubernetes-workshop/
