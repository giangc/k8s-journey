## Assign Pod to Node.
| 2019 Dec. Beta feature.

... This note is not mentioning about how to create multiple nodes and stuff.

### 1. Label node and schedule pod to that labeled node.

### 2. Choose strategy for scheduled pod to K8s cluster.

- Affinity and Anti anfinity: 
- Soft mode and hard mode: If label defined in pod doesn't exist then assign the pod to somewhere else in a cluster, or do not assigned at all.

### 3. Technical handling.

#### Mental note

- Display labels of nodes.
- Assign labels to node.
- Label needs to be meaningful, describing the fact/something special about that node.
- Define pod with created label.

#### Practical note

- Get nodes + its label
kubectl get nodes --show-label

- Assign label: disk=ssd to node01 
kubectl label nodes node01 disk=ssd 

- Create pod happypanda and assign it to node01, where it has disk=ssd.
  - kubectl -f apply happypanda.yaml
  - i.e: 
    - metadata:labels:disk=ssd
    - spec:nodeSelector:disk=ssd

- Remove label node01
  - kubectl label node node01 disk-

- Create affinity pod with soft mode
  - ` spec.affinity.schedule = preferredDuringScheduleIgnoredDuringExecution `
- Create affinity pod with hard mode
  - ` spec.affinity.schedule = requiredDuringScheduleIgnoredDuringExecution `
  
- Create anti affinity pod with soft mode
  - ` spec.antiAffinity.schedule = preferredDuringScheduleIgnoredDuringExecution `
- Create anti affinity pod with hard mode
  - ` spec.antiAffinity.schedule = requiredDuringScheduleIgnoredDuringExecution `

