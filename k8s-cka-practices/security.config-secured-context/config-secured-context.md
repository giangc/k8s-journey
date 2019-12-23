# Config secured context

https://kubernetes.io/docs/tasks/configure-pod-container/security-context/

## Recall
- What is secured context? 
    - It's about ownership setting and access control in Pods and Container.

- What could secured actions possibly be?
    - Secured actions for Pod and container could be:
        - Set secured context to pod
        - Set secured context to container
        - Set linux capabilities to pod
        - Label SE Linux to pod
        - Config root privilege


## Practical 
 - [x]
 
 - Create Security context for pod
    - `pod.spec.securityContext`: `runAsGroup: 2000` `runAsUser: 1000` `fsGroup: 3000`
    - `pod.spec.containers.name[*].securityContext.allowPrivilegeEscalation`
    - Check result by: 
        - `k exec -it pod-name -- sh`
        - `ls -l` # Check access control of file, volume etc.
        - `echo hello > test` # Check access control of `test`
 - Create Security context for container
 - Set linux capabilities for container
    `pod.containers.name[*].securityContext.capabilities = [""]`


## QA
 - what is allowPrivilegeEscalation?
 - Linux capabilities?
 - Root 0 User 1000 UserGroup 2000 fsGroup 3000
 

    