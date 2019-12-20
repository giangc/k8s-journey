
Cluster:: Set up and design
Cluster:: Run
Cluster:: Config high-availability
    - [Doc- HA Cluster](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/)
    - https://kubernetes.io/docs/tasks/administer-cluster/highly-available-master/

Cluster:: Release binaries based on Cluster
    - https://kubernetes.io/docs/setup/#prebuilt-binary-release ?? 

Cluster::Infrastructure:: Provisioning to deploy cluster
    - https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/f9486b081f8f54dd63a891463f0b0e783d084307/docs/01-infrastructure-gcp.md

Cluster::Infrastructure:: Choose configuration
    - https://kubernetes.io/docs/tasks/tls/managing-tls-in-a-cluster/
    - https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/
    
Cluster::Infrastructure:: Choose networking
    - https://kubernetes.io/docs/concepts/cluster-administration/networking/
    - https://kubernetes.io/docs/tasks/administer-cluster/network-policy-provider/calico-network-policy/
    - https://kubernetes.io/docs/tasks/administer-cluster/network-policy-provider/cilium-network-policy/
    - https://kubernetes.io/docs/tasks/administer-cluster/network-policy-provider/kube-router-network-policy/

Cluster::Dev:: Run end to end test on Node and Cluster
    - [github-community: e2e node test](https://github.com/kubernetes/kubernetes/tree/master/test/e2e/node)

Cluster::Dev:: Analyse end to end test result

Cluster::Maintainance::backup

Cluster::Maintainance::restore
    - [Backup and restore by config etcd](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/)
    - [Progress](./k8s-journey/k8s-practices/etcd/README.md)
 
Cluster::Maintainance::process of upgrade os
    - https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/
    - https://cloud.google.com/kubernetes-engine/docs/how-to/upgrading-a-cluster

- [ ] Cluster::Monitor
    - https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/

Cluster::Log::management
    - https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/

Cluster::Architecture
    - https://kubernetes.io/docs/concepts/overview/components/

------

- [ ] SecuredPractice::Config authentication and authorisation
SecuredPractice::Config TLS for cluster
    - [Provisioning certificates and permission](https://github.com/mmumshad/kubernetes-the-hard-way/blob/master/docs/04-certificate-authority.md)
    - [Progress](../k8s-journey/k8s-practices/Secured-Cluster/README.md)

- SecuredPractice::Config secured images
    - https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/

- [ ] SecuredPractice::Config secured context
    - https://kubernetes.io/docs/tasks/configure-pod-container/security-context/

- [ ] SecuredPractice::Config network policy
    - https://kubernetes.io/docs/tasks/administer-cluster/declare-network-policy/
    - https://ahmet.im/blog/kubernetes-network-policy/

- SecurityPrimitives::understand
    - https://kubernetes.io/docs/concepts/policy/pod-security-policy/


------

- [ ] NetworkingFeature::DNS config
    - https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/

- [ ] NetworkingFeature::ingress rules
    - https://kubernetes.io/docs/concepts/services-networking/ingress/

- [ ] NetworkingFeature::load balancer
    - https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/ 

- NetworkingFeature::CNI
    - https://www.dasblinkenlichten.com/understanding-cni-container-networking-interface/
    - https://github.com/containernetworking/cni

------

- [ ] Object::Know how to scale the application
    - https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/#scaling-your-application

- [ ] Object::Know the various way to configurate the application
    - https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/

- Object::Understand the necessary of creating self-healing application


Objects:: API primitives
- [ ] Object::Storage
- [ ] Object::Application::assign with persitent storage
- [ ] Object::Application::Failure

------ 

-  Deployment::Understand the deployment
- [ ] Deployment::Update and rollback
    - https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

------ 

- [ ] Scheduller::config with multiple schedulers to run pods
    - https://kubernetes.io/docs/tasks/administer-cluster/configure-multiple-schedulers/

- [ ] Scheduller::config without scheduler to run pods
    - https://kubernetes.io/docs/tasks/configure-pod-container/static-pod/

- Scheduller::config with scheduler event to run pods

- [ ] Role of DaemonSet
    - https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/

------

- [ ] PersistentVolume::
    - https://kubernetes.io/docs/concepts/storage/persistent-volumes/
    - https://kubernetes.io/docs/tasks/configure-pod-container/configure-volume-storage/
    - https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes

- [ ] PersistentVolumeClaim::
    - https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims


------

- [ ] Failure::Application
    - https://kubernetes.io/docs/tasks/debug-application-cluster/determine-reason-pod-failure/
    - https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application-introspection/
    - https://kubernetes.io/docs/tasks/debug-application-cluster/debug-service/
    - https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application/


- Failure::ControllPlane

- Failure::Node
    - https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/

- Failure::Networking
    - https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/#known-issues

------

- https://kubernetes.io/docs/tasks/manage-daemon/update-daemon-set/
- https://kubernetes.io/docs/tasks/manage-daemon/rollback-daemon-set/
- https://kubernetes.io/docs/tutorials/stateful-application/zookeeper/
