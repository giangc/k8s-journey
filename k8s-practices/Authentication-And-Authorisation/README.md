## Authentication-And-Authorisation
- https://kubernetes.io/docs/reference/access-authn-authz/rbac/
    - This docs I could find .... 
- 

## General learning process 
 - [x] read();
 - [x] mentalRecall();
 - [x] summaryRecall();
 - [ ] mentalPracticalNote();
 - [ ] readPractice() 
 - [ ] practiceSummary() 

## Summary Recall.
 - Important concepts in perimission/authen stuff in K8s include: Role and Cluster Role; RoleBinding and ClusterRoleBinding;
    - Role is granted permission for specified actions in a particular namespace for particular user or group of users.
    - Cluster role is cluster-wide permission granted for specified actions for particular user or group of users.
    - Binding for ClusterRoleBinding and RoleBinding is the act that 'bind' 
 
 - Actions inbetween include:
    - user, group of user, namespace, a domain, ...
    - Grant permission for user to to do thing - defined as `verb`  
    - Grant permission for group of user to to do thing - defined as `verb`
    - 

> Cluster role and role binding would allow “user-1” to grant other users the admin, edit, and view roles in the “user-1-namespace” namespace

- **generative**
    - kubectl create rolebinding root-binding --name root --role cluster-admin

## Practical Note
Across the entire cluster, 
grant the permissions in the cluster-admin 
ClusterRole to a user named “root”:


**correct**
kubectl create clusterrolebinding root-binding \
--clusterrole=cluster-admin \
--user=root