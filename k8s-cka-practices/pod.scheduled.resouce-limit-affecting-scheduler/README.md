# pod.scheduled.resouce-limit-affecting-scheduler 
- https://kubernetes.io/docs/tasks/administer-cluster/manage-resources/memory-default-namespace/

 ## General learning process 
 - [x] read();
 - [x] mentalRecall();
 - [x] summaryRecall();
 - [ ] mentalPracticalNote();
 - [ ] readPractice() 
 - [ ] practiceSummary() 

 ## Mental Note 
  - Motivation: container should not exceeds memory limits
  - What is request and limit?
    - Limit helps namespace to set threshold on resource quota.
    - Request helps to decide pod to be sufficiently scheduled.
  - If container does not specify limit or request, it will take default value from LimitRange and namespace.
 ## Practical Note
  - Create a namespace
  - Create a LimitRange for pods
  - What if Pod Container set memory request but not limit
  - What if Pod Container set memory limit but not request


