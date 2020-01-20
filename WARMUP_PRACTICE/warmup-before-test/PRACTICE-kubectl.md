# PRACTICES
BASIC KUBECTL
1. Run deployment - [x]
2. Scale deployment 
3. dry-run -o yaml deployment - [x]
kubectl run nginx --image=nginx --restart=Never
--dry-run -o yaml > pod.yaml
4. run with client certificate, pem, etc. with kubectl options - [x]
  - 
5. get all - [x]
  - get pods with label

6. watch - [x]
7. describe - [x]
8. explain -> kind of tldr docs - [x]
9. apply -f - [x]
10. create -f - [x]
11. delete - [x]
12. --namespace -n - [x]
13. exec -it
14. view context
15. set context
16. set kubeconfig - [x]
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