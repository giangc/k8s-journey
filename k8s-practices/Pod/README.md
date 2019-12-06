## Pod

## Mental Note
  - Create pods via terminal and yaml.
  - Create readinessProbe to diagnostic on Pod.
  - Create livenessProbe.
  - Execute command in Pod container.
  - Inspect Pod.

## Practical Note
  - *Actually not alot practice for Pod*, because Pod is generally not created separately.

## QA
How many ways are there to create pod?
 On the counting .. 
  1. Create Deployment -> use RelicaSet(default = 1) to create a pod in background.
  2. Create a pod via terminal: `kubectl run my-pod --image=ngninx --restart=Never `
  3. Yaml: `apiVersion: app/v1 \nkind: Pod \n metadata: \n name:my-pod1 \n spec: containers: - name .....`
However ... 

> "In general, users shouldn’t need to create Pods directly. "

## Error listing:
- * spec.template.metadata.labels: Invalid value: map[string]string{"app":"nginx", "bar":"baz"}: `selector` does not match template `labels`
- * spec.selector: Invalid value: v1.LabelSelector{MatchLabels:map[string]string{"app":"nginx", "bar":"baz", "company":"good-company"}, MatchExpressions:[]v1.LabelSelectorRequirement(nil)}: field is immutable

## References:
- [Pod object doc referrence](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.16/#pod-v1-core)
