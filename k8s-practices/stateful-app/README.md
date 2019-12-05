## stateful-app 
### 1. Generative practice.


 ## Mental Note 
 ## Practical Note

    
    ```
    cat <<EOF >./kustomization.yaml
    secretGenerator:
    - name: mysql-pass
    literals:
    - password=123456
    EOF
    ```
    