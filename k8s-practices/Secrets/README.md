## Secrets 
## Mental Note 
- Create and encode secret via yaml or cmd
- Reference to secrets via name, label, selector, annotations.

## Practical Note

echo -n 'admin' | base_64 > username.txt
echo -n '123456' | base_64 > password.txt

- Create secrets via file
k create secret generic my-secret --from-file ./username.txt --from-file ./password.txt

- Use a Secrets to store a application file.

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

- Decode secret: E.g. with base64, basically just base64 --decode.
- Mount a secret as ENVIRONMENT VARIABLE into container volume, so my pod could use it.

## Side notes:

- How to use secrets:

--
 To consume a Secret in a volume in a Pod:
1. Create a secret or use an existing one. Multiple pods can reference the same secret.

2. Modify your Pod definition to add a volume under .spec.volumes[]. Name the volume anything, and have a .spec.volumes[].secret.secretName field equal to the name of the secret object.

3. Add a .spec.containers[].volumeMounts[] to each container that needs the secret. Specify .spec.containers[].volumeMounts[].readOnly = true and .spec.containers[].volumeMounts[].mountPath to an unused directory name where you would like the secrets to appear.

4. Modify your image and/or command line so that the program looks for files in that directory. Each key in the secret data map becomes the filename under mountPath.
--

## QA
  a, What is the difference between stringData and data? E.g data.username= & stringdata.username=
   > stringData will be used over data.
  
