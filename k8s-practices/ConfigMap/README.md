
 ## ConfigMap 
 [Configure pod with config map](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)

## Mental Note
- Create ConfigMap from file
- Create ConfigMap from multiple files
- Create ConfigMap from environment file
- Create ConfigMap from multiple environment files
- Create ConfigMap from literal key values
- Create ConfigMap from configMapGenerator via kustomization.yaml
- Use ConfigMap in Pod
- Use ConfigMap in Pod as Environment Variable
- Use ConfigMap data to populate Volume
- Use ConfigMap data to populate specific path in Volume
- Check ConfigMap used in Pod using logs.

## Error
 - `error: cannot exec into a container in a completed pod; current phase is Succeeded`

## Practical note
- Kubectcl
    - `kubectl logs pod-1`

- Yaml

 
## QA
1. What's differences between --from-env-file and --from-file? 
2. I create a pod: container img = busybox. As a result, the status is Completed, How can I make it run?
