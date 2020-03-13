Environment variable is required to inject input variable into configuration file such as: DB name, password, or background color and so on. In pod, I can create environment variable for a container. E.g: 
  - `containers.env[*].name[*].value`
ConfigMap is created to extract Environment variable into different file config, but it's optional. Using config map in a pod, defines `containers.env[*].name[*].`, value is replaced with valueFrom.

Search model: 
- create configmap using `--from-literal` via `kubectl create`
- [Use config map in a pod](https://github.com/kubernetes/website/blob/edb233cac2f4f910dd55311a3c63bdfbd53a081b/content/ja/examples/windows/configmap-pod.yaml)
