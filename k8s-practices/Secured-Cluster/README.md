# Secured-Cluster - Create and provision certificates to Kubernetes clients
- https://github.com/mmumshad/kubernetes-the-hard-way/blob/master/docs/04-certificate-authority.md
- https://kubernetes.io/docs/concepts/cluster-administration/certificates/#openssl

 ## General learning process 
 - [x] read();
 - [x] mentalRecall();
 - [x] summaryRecall();
 - [x] readPractice() 
 - [x] mentalPracticalNote();
 - [x] practiceSummary() 
 
 ## Mental Note 
 ### mentalRecall()
 - Create crt(certificate) and pem(permission) in Server Node.
 - Provision to all clients
 - Client used to create crt and pem, such as: openssl, ...

 ### summaryRecall()
 - PKI is required for all communication between K8s clusters.
 - Client: KubeController, kube scheduler, kubeapiserver, worker nodes, admin permission, etc.

 ## Practical Note
- Create private key for CA
`openssl genrsa -out ca.key 2048`

- Create CSR using the private key
`openssl req -new -key ca.key -subj "/CN=KUBERNETES-CA" -out ca.csr`

- Self sign the csr using its own private key
`openssl x509 -req -in ca.csr -signkey ca.key -CAcreateserial  -out ca.crt -days 1000`

- `openssl genrsa -out admin.key 2048`
- `openssl req -new -key admin.key -subj "/CN=admin/0=system:masters" -out admin.csr`
- `openssl x509 -req -in admin.csr -CA ca.crt -CAkey ca.key -CAcreateserial  -out admin.crt -days 1000`
- openssl x509  -noout -text -in ./ca.crt

- Etcd
    - openssl genrsa -out etcd-server.key 2048
    - openssl req -new -key etcd-server.key -subj "/CN=etcd-server" -out etcd-server.csr -config openssl-etcd.cnf
## Error
- Can't load ./.rnd into RNG
 > https://github.com/openssl/openssl/issues/7754
 > @bathindahelper I had the same issue as you on Ubuntu 18.04.x. Removing (or commenting out) RANDFILE = $ENV::HOME/.rnd from /etc/ssl/openssl.cnf worked for me.

- req: Skipping unknown attribute "0"

## mentalPracticalNote()
- Create Certificate Authority
- Create Certificate Signing Request
- Create Signed Certificate(self sign)

## practiceSummary()
- PKI: Private key infrastructure is supported in K8s. 
- What is PKI in brief? 
- In PKI: Private key is something that should be kept safely. Signing request and Signed Permission should be provisioned to clients.
- Client in K8s infra should be any cluster, which play as kube controller, kube api server, kubeblet, kube scheduler, kube proxy, etcd cluster, service account key pair.
