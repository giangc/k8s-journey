## Secrets 

## Mental Note
- Create and encode secret via yaml or cmd
- Reference to secrets via name
- Use secret from pod via volume
- Create volume for Secret
- Use Secret to store ENVIRONMENT VARIABLE
- Use SecretGenerator Kustomization.
- Don't assume base64 is secure method.
- Because Secret creating process is executed before creating Pod, sometimes we need to program yaml file from terminal such as using cat <<EOF >file \ content \ EOF
- Create a volume to store public ssh key

## Practical Note
echo -n 'admin' | base_64 > username.txt
echo -n '123456' | base_64 > password.txt

- Create secrets via file
k create secret generic my-secret --from-file ./username.txt --from-file ./password.txt

- Use a Secrets to store a application file. **What is that even mean?**

    ```
    stringData:
    config.yaml: |-
        apiUrl: "https://my.api.com/api/v1"
        username: {{username}}
        password: {{password}}
    ```

- [Manage K8s objects with Kustomization.yaml](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/)

- Create secret using SecretGenerator in Kustomization

  ``` 
  cat <<EOF >./kustomization.yaml
    secretGenerator:
    - name: db-user-pass
    files:
    - username.txt
    - password.txt
    EOF
  ```

- Encode secret: i.e: with base64 **actually base64 is kinda useless**
    > To encode: echo -n "myusername123" | base64
    > To decode: echo -n "myusername123" | base64 --decode

- Mount a secret as ENVIRONMENT VARIABLE into container volume, so my pod could use it.

- Create pod from: 
    > `k run pod --image-name nginx` will default with **Restart policy**. To delete it, get deployments and delete the deployment.
- Create pod with iamge busybox and restart policy = never
  > `k run pod --image=busybox --restart=Never` --> Status=COMPLETED.
- Projection secret to specified path
    > `pod.spec.containers.volumeMounts:` 
        - name
        - mountPaths
        - readOnly

- Give permission to secret files
    > `mode: 511`  **Not know yet: how to intepret into octonal value at the moment** 

- Consume file by running cmd inside a pod's container
    > **Not known yet**
- Composition of a secret inside a pod:
    Composition of Pod:
```
    - Pod 
        - metadata
            ... 
        - spec
            - volumes
                - name
                - secret
    Composition of Secret:
        - secret
            - secretName
            - items
                - key
                - path
                - mode
```

- `kubectl create secret generic ssh-key-secret --from-file=ssh-privatekey=/path/to/.ssh/id_rsa --from-file=ssh-publickey=/path/to/.ssh/id_rsa.pub`

```
    volumes:
    - name: secret-volume
        secret:
        secretName: ssh-key-secret
    containers:
    - name: ssh-test-container
        image: mySshImage
        volumeMounts:
        - name: secret-volume
        readOnly: true
        mountPath: "/etc/secret-volume"
```    

- **Use-Case** Pods with prod / test credentials
    - `kubectl create secret generic prod-db-secret --from-literal=username=produser --from-literal=password=Y4nys7f11`
    - `kubectl create secret generic test-db-secret --from-literal=username=testuser --from-literal=password=iluvtests`

- **Use-case**: Dotfiles in secret volume

- **Use-case**: Secret visible to one container in a pod

## Side notes:
To consume a Secret in a volume in a Pod

```
    1. Create a secret or use an existing one. Multiple pods can reference the same secret.

    2. Modify your Pod definition to add a volume under .spec.volumes[]. Name the volume anything, and have a .spec.volumes[].secret.secretName field equal to the name of the secret object.

    3. Add a .spec.containers[].volumeMounts[] to each container that needs the secret. Specify .spec.containers[].volumeMounts[].readOnly = true and .spec.containers[].volumeMounts[].mountPath to an unused directory name where you would like the secrets to appear.

    4. Modify your image and/or command line so that the program looks for files in that directory. Each key in the secret data map becomes the filename under mountPath.

```

## QA
  a, What is the difference between stringData and data? E.g data.username= & stringdata.username=
   > stringData will be used over data.
  
  b, Is this true if Delete a deployment will delete a namespace?
  What is 'mode: 511' for? 
  How can I put mode read-only for secret file?

## Safe practice
 - Don't commit secret file into repo
 - Encrypt secret data at REST
 - https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/
