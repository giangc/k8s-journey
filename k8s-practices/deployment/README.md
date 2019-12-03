## Deployment
[Basic]

### Generative practice
- Recall about deployment:
  - To deploy: create a service; ip forward to public port; defines config such as: replicas
  - Also created via 2 ways: kubectl or yaml
  - Why do we need to create deployment? If I say that I could just create pod and run it? Basically create pod is just create a pod. But Deployment seems not belong to scope of Pod. Consider the architecture, we need to create several things to run a basic thing in k8s. At least pod, networking to public, some form of monitoring, some form of cicd work to continuous deploying application: i.e: helm.
  - Recall from the last practice about Deployment:
  	- I can create deployment from scracth, 
  	- I can inspect via some basic commands,
  	- I can config via yaml: kind:Deployment \ name:my-deployment1 \; volume, etc.


## Mental Note
- Create
- Pause and resume
- Display status
- Roll back, roll out

## Practical Note

## Out of box question.
 1. What is scope of Pod?
 2. What do I need to conduct a basic deploying an app to k8s?



