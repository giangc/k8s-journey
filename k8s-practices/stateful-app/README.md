## stateful-app 
### 1. Generative practice.
Several questions that I should think first.
1. Can I do it in minikube?
  - This is just an app. And I deploy it on my machine.  [v]

2. What is this consist of?
  - Multiple containers for Wordpress app: php, mysql, theme, css, html, etc. etc. ~Never been addressed~
  - Volume: File System for database. [v]

3. What step by step proceess is this to solve this problem?
  1, Setup the cluster.
  2, Create a volume: persistent volume -> For database. Create a label: mysql-volume 
  3, Create a pod contains all of my containers stack for Wordpress:
    3.2, Networking containers together(Mysql, server app: apache2 and so forth); expose the network into the world
    3.3, Containers: mysql probably needs a label, why? Because it probably shared among other things.
  4, Create a network, and label it so that pod could be used.
  5, Create a deployment, which could be StatefulSet
    5.1, Setup label so that pod could be used.
    5.2, Use the volume

4. What does this means to be a Stateful application?
  Because the way to deploy the Stateful application is different compare to Stateless application.
  Stateful app is a type of app where its context(everything: display info, account state, item state(pending, checkout etc.), etc.) is different over some input setting.
  Stateless app is a type of app where its context of the app does not depends on app input setting.

5. What is the overal composition of whole thing?
    ConfigMap -> Volume -> StatefulSet -> Pod -> Wordpress Containers Stack.

## Compositions
   - Pods
   - Service
   - Secret
   - Containers
   - PV and PVC
   - Run multiple yaml config using kustomization.yaml

## Mental Note
   
   - 
## Practical Note
Use cat EOF to input text to kustomisation.yaml file.


    ```
      cat <<EOF >./kustomization.yaml
      secretGenerator:
         - name: mysql-pass
      literals:
         - password=123456
      resources:
         - mysql-deployment.yaml
         - wordpress-deployment.yaml    
      EOF
    ```
   
   - kustomization.yaml
      > `kubectl apply -k ./`
      > `kubectl delete -k ./`

   - Get service url(minikube)
      > `minikube service <service_name> --url`

   - Troubleshooting:
      > `kubectl describe pod <pod_name>`
   
   - Encoded password with base64:
      > `echo -n 'abcde' | base_64`
