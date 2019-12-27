# storage.concept 
https://kubernetes.io/docs/concepts/storage/persistent-volumes/

https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/

 ## General learning process 
 - [x] read();
 - [x] mentalRecall();
 - [x] summaryRecall();
 - [x] mentalPracticalNote();
 - [x] readPractice() 
 - [x] practiceSummary() 

 ## Mental Note 
  - Persistent volume is a mechanism for administrator to provision data storage. Claim(Persistent Volume Claim) is a request from k8s objects(pods, namespace, etc.) for data storage. Based on the claim, k8s binds PV to appropriate PVC. Any config variations would be resolved via StorageName.
  - There are 2 ways of binding: static and dynamic. 
    - Static is binding any PVC to matched PV without any exceeds.
    - Dynamic is in case of some PVC exceeds PV limits, then in this case, user will at least get the desired amount of persistent volume. This provisioning job is based on Storage Classes, which is created in case of dynamic provisioning occur. Otherwise, it will be unbound forever.
  - Storage Class in use for protection: which helps to prevent data loss in case of PV or PVC is removed from the system. When PV is removed, it's not really removed untill no PVC binding. Same as PVC.
 - Reclaiming helps to reclaim volume manually, based on state of the volume, which are currently: Retained, Deleted, Recycled(deprecated).
 
 ## Practical Note
  1. Describe 2 ways of binding volume in K8s?
  2. Describe [Storage Class](.storage-class.md)
  3. [Config to use Persistent Volume](.config-to-use-pv-and-pvc.md)

