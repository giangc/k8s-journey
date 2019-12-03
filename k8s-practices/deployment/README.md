## Deployment
[Basic]

### Generative practice 1.
- Recall about deployment:
  - To deploy: create a service; ip forward to public port; defines config such as: replicas
  - Also created via 2 ways: kubectl or yaml
  - Why do we need to create deployment? If I say that I could just create pod and run it? Basically create pod is just create a pod. But Deployment seems not belong to scope of Pod. Consider the architecture, we need to create several things to run a basic thing in k8s. At least pod, networking to public, some form of monitoring, some form of cicd work to continuous deploying application: i.e: helm.
  - Recall from the last practice about Deployment:
  	- I can create deployment from scracth, 
  	- I can inspect via some basic commands,
  	- I can config via yaml: kind:Deployment \ name:my-deployment1 \; volume, etc.

## Mental Note
1. Create
  - .yaml with replicas and pod template.
  - kubectl apply -f.
  - Shows deployments.
  - Show rollout status.
  - Get ReplicaSet
  - Update Deployment, could be something like:
    - update the container version
    - update the label
    - name
    - etc.

2. Pause and resume

3. Display status
    - Display status for Progress Deployment, Complete Deployment, Failed Deployment.
    - Tracking failed Deployment by:
        > Setup deadlineProgressSeconds.
        > When progress deadline is passed, k8s updates the status.
4. Roll back, roll out,
5. Scale: horizontal scaling, proportional scaling, auto scaling.


## Practical Note
1. Create
  - Create Deployement with 3 replicas, with `spec.replicas: 3`
  - Show roll out status of deployemt
    - `kubectl rollout status nginx-deployment`
  - Get ReplicaSet
    - `kubectl get rs`

2. Update: rollback and rollout
  - kubectl,
    - Update deployment: image version.
    - `kubectl set image deployment/nginx-deployment nginx=nginx:1.9.1 --record`
    - Update deployment: name.  
        - `kubectl set name deployment/nginx-deployment name=my-nginx --record`
    - Check the revision:
        - `kubectl rollout history nginx-deployment`
    
    - To rollback to the revision.. very likely to update:
        - `kubectl set image deployment/nginx-deployment nginx=nginx:1.8.1 --record=true`
    - To rollback to the previous version:    
        - `kubectl rollout undo deployment.v1.apps/nginx-deployment`

  - yaml,
    - Update yaml and type
      - `kubectl edit deployment/deployment-nginx.yaml`

3. Scaling: scaling and proportional scaling.
  - Scaling:
    - `kubectl scale deployment deployment.v1.apps/deployment-nginx --replicas=10`
  - Automate horizontal scaling
    - `kubectl autoscale deployment deployment.v1.apps/deployment-nginx --min=10 --max=15 cpu-percent=80`
    - `kubectl get deploy`

4. Pause and resume
    - `kubectl rollout pause deployment.v1.apps/nginx-deployment`
    - `kubectl rollout resume deployment.v1.apps/nginx-deployment`
    - `kubectl rollout history deployment.v1.apps/nginx-deployment`: During the pause, rollout will not be carried out..

5. Check status
    - Detect failed Deployment:
        - `kubectl patch deployment.v1.apps/nginx-deployment -p '{"spec":{"progressDeadlineSeconds":600}}'`
    - `kubectl rollout status deployment.v1.apps/nginx-deployment`
    - Get replicaSet:
        - `kubectl get rs`
        - `kubectl get pods,ns,deployments,rs`
    - Some failure samples:
        - `ReplicaFailure  True    FailedCreate`
        - ``` 
        message: 'Error creating: pods "nginx-deployment-4262182780-" is forbidden: exceeded quota:
        object-counts, requested: pods=1, used: pods=3, limited: pods=2'
        reason: FailedCreate
        status: "True"
        type: ReplicaFailure 
        ```

6. Setup rolling strategy.
    - Yaml.
        - `spec.strategy=Recreate` or `spec.strategy=RollingUpdate`
        - For `spec.strategy=RollingUpdate` `maxSurge` or `maxUnavailable` 

7. Create proxy connection.
    - `kubectl proxy`
## Out of box question.
 1. What is scope of Pod? 
 - ReplicaSet create Pod in a background.
    
 2. What do I need to conduct a basic deploying an app to k8s?



