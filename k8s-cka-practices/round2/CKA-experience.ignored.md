# Exam contents 
 - Pod
 - Deployment
 - Service
 - DaemonSet
 - static pod
 - Simple scheduler
 - Multiple Container pods
 - Init container pods
   - Inside container: arg and command
 - Different namespaces
 - kubectl
  - normal commands:
    ```
    - run pod
    - create deployment
    - create ds
    - expose service --type=NodePort --target-port=8080 --port=8080
    - get -o wide --dry-run
    - get -o yaml
    - describe
    - scale deployment --replicas
    - edit pod
    - edit deployment
    - drain node
    - uncordon node
    - get all --all-namespaces
    ```
  - advance commands(Check website - Reference)
    ```
    - -o custom-columns
    - --sort-by
    ```
 - Linux commands: 
    ```
    - nslookup
    - touch
    - cp: to clone file
    ```
 - Networking 
    - expose service and test via a test pod: kubectl exec
 - Node networking
 - Secret: as a environment variable, as a volume and a file
 - kubeadm
 - Cluster troubleshooting: node problem, networking problem
 - Persistent Volume

# Exam taking experiences
- Easy to hard can be defined as time to complete the question.
  - Hardest question could not be solved with current knowledge or taking too long to solve
  - Hardless question take long time to solve ~ 20 mins
  - Easy question take less time to solve ~ 2 - 7 mins
 - Not quite enough time, if a person have many hardest questions or many hardless questions.
 BUT this process could be improvable.
 - Problem statement could be fairly easy to understand
 
# Tips and workflows
  **With vim**
  - Search: /word to search
  - Delete multiple lines: Shift + V + :d

  **With notepad(Built in)**
  - Note Skipping questions if have chance to come back. Without this, it's hard to recall the state of error
  - SKIPPING: 4(init container fail)
  - log work process based on question could be useful: 
    - `e.g q1-pod1.yaml, kubectl run pod --image=nginx:1.11`

 **Problem with copy and paste**: I had this problem maybe because of my old laptop
 
 Knows what can be searched with the website or its extension.
 
 # Way to search: doc and github
  **Pros of github search:**
  - Search the yaml file directly
  - Better Search pattern: 
  - search for docs: /en/docs 
  - search for yaml: enter podsecret -> click on yaml on the left menu
  - Search all in this repository

  **Pros of Website search:**
  - Nicer, better UI.
  - Little bit of words presented with config code if required to read the context.
  - Prefer to read title, article.
  - Article should contains both config and text.
  - Easier to follow and understand: 
    - **Getting Started**: Set up cluster/environment with any supported tools
    - **Concept**: Concept driven knowledge + practice
    - **Tasks**: Practical task based article
    - **Tutorial**: Full-fledged example of k8s on several types of web applications.
    - **Reference**: External related projects to k8s
    - Kubectl is really well documented in website -> check Reference
      - kubectl generatated is good for: 
        - advance cmd
        - know which can be `kubectl create`
  
  **kubectl**
  
  kubectl is a kube-apiserver client which essentially a tool that control everything. Understanding how kubectl is documented is important.
  - **Overview of kubectl**
  - **kubectl**: Search kubectl and check detail generated kubectl docs
    - Finding concrete example
    - Knowing which component can `create`
    - Something small which fits your workflow model.
  - **kubectl cheatsheet**: kubectl command driven by tasks
  - **JsonPath support**: how to query stuff with JsonPath. Used in kubectl advance like: `custom-columns`

# Planning for the exam

  - Know how to perform and how to test by kubectl
  - Understand the importance of searching process: searching is the process of retrieving from memory
  - Pay attention to workflow and improve workflow could improve performance.
  - Manage practice process based on topic: Best is following the [udemy course](https://www.udemy.com/course/certified-kubernetes-administrator-with-practice-tests/learn/lecture/15594406?start=1#overview). Retrospect frequent.
  - Aware of being lost, overwhelm feeling, because k8s is large. It's ok. Because the exam scope is not everything. In fact nobody could know everything about k8s.(Joe Beda said it)

# Result
 **1st attempt**: FAILS - 66%:74%
  - Networking, cluster management, troubleshooting took weights. Clearly I didn't have sufficent knowledge to solve it.
  - Troubleshooting: either with kubeadm or the hardway
    - With kubeadm: check /etc/kubernetes/..
    - With the hard way: 
      - use `service`
      - use `journalctl -l`

# Thinking
