## 3 Types of deployment object api: Deployment StatefulSet DaemonSet

"It is important to note that Deployments leverage and automatically create "ReplicaSets" and

"use these to automatically restart pods if they crash as well an maintain the desired number of pods."

### Mental note:
Create a deployment with 2 replicas | Containers would be some random http server.
 
 > basic_deployment.yaml

 - k get rs
 - k get deploy
 - k get pods -o wide
   >> IP : 172.17.0.8 have not yet forwarded the ip.

> basic_ds.yaml

"The DaemonSet differs from a basic Deployment because it will only run 1 Pod on each host."

"Run the daemonset on the same pod"

-----------------------------------

Tutorial from [boxboat](https://boxboat.com/blog/)

