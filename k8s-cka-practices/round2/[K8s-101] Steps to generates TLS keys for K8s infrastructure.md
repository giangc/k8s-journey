# K8s-101: Steps to generates TLS keys for K8s infrastructure

### GENERAL
**1. Generates key**
**2. Certificate signing request**
**3. Sign certificates**

### PROVISIONING PKI FOR K8S PLAN
- Create CA Certificate
- Create components certificate and use CA certificate to sign them
- Create certificates for worker nodes.

### PROVISIONING PKI FOR K8S IMPLEMENTATION
1. Create CA Certificate
- `openssl genrsa -out ca.key 2048`
- `openssl req -new -key ca.key -subj “/CN=KUBERNETES-CA" -out ca.csr`
- `openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt # Self sign since it’s CA`

2. Create components Certificate and use CA certificate to sign them
    1. Create admin pairs
        - `openssl genrsa -out admin.key 2048`
        - `openssl req -new -key admin.key -subj “CN=kube-admin/O=system:masters" -out admin.csr`
        - `openssl x509 -req -in admin.csr -CA ca.crt -CAKey ca.key -out admin.crt #`
        - **Search how to generate certifcate** Github: > openssl > 6. Generate the server certificate using the ca.key, ca.crt and server.csr

    2. Create kube-scheduler pairs
        - `openssl genrsa -out kube-scheduler.key 2048`
        - `openssl req -new -key kube-scheduler.key -subj "/CN=system:kube-scheduler" -out kube-scheduler.csr`
        - `openssl x509 -req -in kube-scheduler.csr -CA ca.crt -CAKey ca.key -out kube-scheduler.crt`
        - `openssl x509 -req -in akshay.csr -CA /etc/kubernetes/pki/ca.crt -CAKey /etc/kubernetes/pki/ca.key -out akshay.crt`
        - **Search how to generate certifcate** Github: > openssl > 6. Generate the server certificate using the ca.key, ca.crt and server.csr

3. Create certificates for worker nodes
    - with name of: system:node:node01
    - with group of system:nodes


References
--- 
Docs links:
https://kubernetes.io/docs/concepts/cluster-administration/certificates/#openssl
