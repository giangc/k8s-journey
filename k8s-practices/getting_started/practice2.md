## Continue to work on katakoda, However I would need to start again the minikube and shit :) 

Create the namespace via yaml 
`kubectl apply -f test-namespace.yaml`

Run test-pod.yaml, which is create a pod 
`kubectl apply -f test-pod.yaml`

pod-namespace: schedule pod to be run with dev-service1 namespace
`kubectl apply -f pod-namespace.yaml`

pod2: update pod-namespace 
`kubectl apply -f pod2.yaml`

Utilities
-----------

## Namespace
#### Get all
`kubectl get namespaces`
#### Get single
`kubectl get ns test`

#### Get single output yaml
`kubectl get ns test -o yaml`

#### Describe
`kubectl describe ns test`

#### delete
`kubectl delete namespace test`

## Pod
#### Get
`kubectl get pods`
`kubectl get pods -n dev-test1`

#### Delete
`kubectl delete pod happypanda`
`kubectl delete pod happypanda -n dev-test1`
`kubectl delete pod happyelephant -n mynamespace`
#### Error
- error: error validating "own-practice.yaml": error validating data: [ValidationError(Pod.spec.containers[1]): 

- missing required field "containerPort" in io.k8s.api.core.v1.ContainerPort, ValidationError(Pod.spec.containers[2].ports[2]):

- missing required field "containerPort" in io.k8s.api.core.v1.ContainerPort, ValidationError(Pod.spec.containers[2]): 

- missing required field "name" in io.k8s.api.core.v1.Container]; if you choose to ignore these errors, turn validation off with --validate=false

Error | Reason | E.g
----- | ------ | ---
invalid type for io.k8s.api.core.v1.PodSpec.containers: got "map", expected "array" | Expected an array for containers, and probably start thing with '-' | `containers: - name: jenkins`
missing required field "name" in io.k8s.api.core.v1.Container, ValidationError(Pod.spec.containers[2].ports[0]): |  Missing a compulsory field in yaml | 





