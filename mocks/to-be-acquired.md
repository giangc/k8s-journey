# find()

## Linux skills
 - [ ] (i-reversed-search)
 - vim
   - [x] Edit
   - [x] Save and quit
   - [ ] Delete lines
   - [ ] Search text
   - [ ] Navigate to beginning or end or text
 - [x] Systemd
   - Controling system service in Linux, where the basic is you can list, check status, stop, start, restart services. I.e kubelet service.
 - **Useful random stuff that I saw somewhere, lol.**
   - [ ] ls -ltr | tail -2
   - [ ] cat csr | base64 | tr -d "\n"
   - [ ] ssh node01

## Kubernetes by heart
- **Useful cmd stuff that I saw somewhere, and never get practiced during the Practice/Tutorial/Tasks or I think I never found it to be useful ... lol.**
 - `-o yaml --dry-run > file.yaml`
 - `--record=true`
 - `kubectl run generator= ... `
- Checking result cmd:
  - describe
  - rollout history
  - ls
  - cat
  - explain resource.name

 - **Workflow**
   - --dry-run then create yaml; then kubectl create -f file.yaml
   - cp file.yaml file2.yaml; then edit
   - Make small change and check result everytime
   - address bar could be used for fast typing, copy paste, config small variation.
   - I can keep my white wordpad note during the exam