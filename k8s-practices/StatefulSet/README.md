# StatefulSet 
> https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set

 ## General learning process 
 - [x] read();
 - [x] mentalRecall();
 - [x] summaryRecall();
 - [x] mentalPracticalNote();
 - [ ] readPractice() 
 - [ ] practiceSummary() 
 ## Mental Note
 - StatefulSet is similar to Deployment since managing pod via `spec.template`
 - StatefulSet is used for stateful applications where it requires to have storage: persistent volume claim.
 - Components required for a stateful application in kubernetes: service, sts, storage, 
 - Functions: update strategy, config volume setting: mount path, capacity, etc.; config tolerations, templating pod; setting up persistent volume claim...
 
 ## Practical Note
 - update stateful set using patch: 
   - `kubectl patch statefulset web2 -p '{"spec":{"replicas": 4}'`
 - kubectl patch statefulset
   - `kubectl patch statefulset web2 -p '{"spec":{"updateStrategy":{"type":"RollingUpdate","rollingUpdate":{"partition":2}}}}'\n`
 - delete a statefulSet without deleting a pod:
   - `kubectl delete statefulset web2 --cascade=false`
