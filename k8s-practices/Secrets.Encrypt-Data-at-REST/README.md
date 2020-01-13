# Secrets.Encrypt-Data-at-REST 
 - https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/

 ## General learning process 
 - [x] read();
 - [x] mentalRecall();
 - [ ] summaryRecall();
 - [ ] mentalPracticalNote();
 - [ ] readPractice() 
 - [ ] practiceSummary() 
 ## Mental Note 
  - Basecode64 is useful only to prevent you accidentally expose your password for others.
  - Encrypt data at REST makes Secret more secured because, it shares security responsibility to mulitple places including: Secrets file, kube-apiserver, secret provider, (kms something).
  - Safe steps of process to perform update data encryption at rest: 
    - Encrypt data(using EncryptionConfiguration + data provider)
    - Add encrypt data.
    - Verify if the data is encryptable, decryptable.
    - Rolling update encrypted data for all the file.
    - Remove the old encrypted data entries.
   
 ## Practical Note
