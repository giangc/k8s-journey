# Random stuff
 ON EPS: 71. APPLICATION COMMANDS

## Questions
1. Scheduder schedules pod on node, using taint and toleration.. Consider scenario following, in what context, I as an admin create those pods? Context means an admin could be on his PC, could be ssh to vps, etc.

2. Scheduling pod on nodes: It's advised to **not** create any pod without its deployment... 
So basically at this point, created pod have never been on any node... And there are multiple nodes.
 * Where/In what context, do I create those pod?
 * How can I create pods so that can be scheduled into Nodes?
 
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


