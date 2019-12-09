## stateless-app 
- [kubernetes.io: Tutorial: guestbook: php; redis](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/)
### Generative practice.

## Mental Note

## Practical Note

`kubectl expose rc frontend-6cb7f8bd65 --port=80 --target-port=8000 --tier=frontend`
`kubectl port-forward frontend-6cb7f8bd65-bf65q 8080:80`
`kubectl expose deployment frontend --type=NodePort --name=frontend`

`microk8s.kubectl expose deployment frontend --type=NodePort --name=frontend3`