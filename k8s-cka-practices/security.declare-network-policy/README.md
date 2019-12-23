# [security]declare-network-policy 

- [x]https://kubernetes.io/docs/tasks/administer-cluster/declare-network-policy/

 ## General learning process 
 - [x] read();
 - [x] mentalRecall();
 - [x] summaryRecall();
 - [x] mentalPracticalNote();
 - [x] readPractice() 
 - [x] practiceSummary()

 ## Mental Note
  - Declare network policy for pods communication over network with the use of label.
  - Create a nginx deployment and expose it
  - Test the exposed service via another pod
  - Create a network policy which only allow any pods with access = true can access the exposed service
  - Create another pod which is labeled with access = true
  - See if it works

 ## Practical Note
 - Checking connection with: create busybox pod and running it by cmd; wget --spider -timeout=1 
 - Could not run with local minikube yet.

## Reading
https://ahmet.im/blog/kubernetes-network-policy/
 - Network policy feature which allow to control the in and out connection between pods. I.e: 1 way connections or 2 way connections, or rule based.
 - Old term is access control list