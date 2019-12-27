# storage.config-pod-to-use-persistent-volume
https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/


 ## General learning process 
 - [x] read();
 - [x] mentalRecall();
 - [x] summaryRecall();
 - [ ] mentalPracticalNote();
 - [ ] readPractice() 
 - [ ] practiceSummary() 
 ## Mental Note

 ## Practical Note
Steps: 
- Create persistent volume as a admin. Create a file in that volume path via ssh.
- Create a persistent volume claim that bind to persistent volume as developer
- Create a pod that use the volume claim `spec.persistentVolumeClaim[*].name`
- Check by going to ssh, curl http://localhost to see the file mounted to path.
