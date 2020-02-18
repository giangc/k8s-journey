## Questions
1. Scheduder schedules pod on node, using taint and toleration.. Consider scenario following, in what context, I as an admin create those pods? Context means an admin could be on his PC, could be ssh to vps, etc.

2. Scheduling pod on nodes: It's advised to **not** create any pod without its deployment... 
So basically at this point, created pod have never been on any node... And there are multiple nodes.
 * Where/In what context, do I create those pod? 
 * How can I create pods so that can be scheduled into Nodes?

3. What's the difference between ReplicaSet and Deployment?
  * [quora answer](https://www.quora.com/What-is-the-main-difference-between-a-replica-set-and-a-deployment-in-Kubernetes)
    * **Summary**: Both are to deploy pods. Deployment actually create a replicaset in the process of deploying. So that, it's the 'onion' process of deployment: Deployment -> ReplicaSet -> Pods. And, ReplicaSet could be executed separately. However, the replicaSet does not have rolling update feature.

## bash 
wc -l  : calculate number 
kubectl get all -l 
`kubectl -l`: kubectl with selector

## Random goodies
- `kubectl get all`
- `kubectl rollout status`
- `kubectl rollout history`
- `watch kubectl rollout status`
- default update strategy is: RollingUpdate. Recreate will have down time. 


