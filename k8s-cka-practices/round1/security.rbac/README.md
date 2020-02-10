# security.rbac 
- https://kubernetes.io/docs/reference/access-authn-authz/rbac/

- [Test rbac](https://www.yld.io/blog/testing-kubernetes-rbac/)
 ## General learning process 
 - [x] read();
 - [ ] mentalRecall();
 - [ ] summaryRecall();
 - [ ] mentalPracticalNote();
 - [x] readPractice() 
 - [ ] practiceSummary() 
 ## Mental Note 

 ## Practical Note
- `kubectl get clusterroles | grep -i rbac`
- `kubectl auth can-i create pods`
- `kubectl auth can-i create pods --as=jane`
- `kubectl auth can-i watch pod --as=manager`
- kubectl create namespace my-namespace

- kubectl create rolebinding my-sa-view \
  --clusterrole=view \
  --serviceaccount=my-namespace:my-sa \
  --namespace=my-namespace
  