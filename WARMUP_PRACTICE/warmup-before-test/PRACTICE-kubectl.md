# PRACTICES
BASIC KUBECTL
1. Run deployment
2. Scale deployment 
3. dry-run -o yaml deployment
kubectl run nginx --image=nginx --restart=Never
--dry-run -o yaml > pod.yaml
4. run with client certificate, pem, etc. with kubectl options
  - 
5. get all
  - get pods with label

6. watch
7. describe
8. explain -> kind of tldr docs
9. apply -f
10. create -f
11. delete
12. --namespace -n
13. exec -it
14. view context
15. set context
16. set kubeconfig
  - https://kubernetes.io/docs/reference/kubectl/kubectl/ kubectl config
  - kubectl config set-context
  - kubectl config set-cluster
17. Edit in yaml and save
  - `kubectl edit deployment/mydeployment -o yaml --save-config`
18. rollout 
19. scale 
20. set 

- Review all api resources: `kubectl api-resources`
- Review all api resources that are namespace-able: `kubectl api-resources --namespaced=true`
- Inspect auth: `kubectl auth can-i create pods`
- Update using patch: `kubectl patch deployment patch-demo --type merge --patch "$(cat patch-3.yaml)"`
- kubectl taint nodes node01 dedicated=special-user:NoSchedule
- To tolerate 
	```
	tolerations:
	- key: "dedicated"
		operator: "Equal"
		value: "special-user"
		effect: "NoSchedule"
		```

- kubectl run generator under /conventions/generators 
https://kubernetes.io/docs/reference/kubectl/conventions/#generators