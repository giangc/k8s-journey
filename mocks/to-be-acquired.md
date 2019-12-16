# find()

## Linux skills
 - [x] (i-reversed-search)
   - Search text thru cmds history from the recent to the oldest.
   1. [Ctr + r] Trigger;
   2. Type the keyword.
   3. Right arrow.
 - vim
   - [x] Enter Edit mode: `ESC + i`
   - [x] Save and quit: `ESC + wq`
   - [x] Quit without saving: `ESC + q!`
   - [x] Delete single line: point to deleting line; `ESC + :d`
   - [x] Search text: ESC + /search_pattern; press 'n' or 'N' for next/previous search
   - [x] Search and replace text whole file: ESC + :%s/search_pattern/replacement/g
   - [x] Undo: ESC + :u
   - [x] Move to start of line: ESC + :0
   - [x] Move to end of line: ESC + :$
   - ESC is kinda like boss command which helps to escape from interactive mode...

 - [x] Systemd
   - Controling system service in Linux, where the basic is you can list, check status, stop, start, restart services. I.e kubelet service.
   - `systemctl status kubelet`
   - `systemctl list | grep .service`
   - `systemctl stop | start | restart kubelet`

 - **Useful random stuff that I saw somewhere, lol.**
   - [x] ls -ltr | tail -2: 
     - Long format list of all files, sorted by modification date (oldest first)
     - 2 last files
   - [x] tr -d "\n"(Probbaly doing with pipelines as well... Saw a dude who used this to have and cut the private ssh key).
     - tr: text replacement
     - `-d`: delete
     - tr -d "\n": Text replacement(probably with the file input) with option delete all the new line char.
   - [x] ssh node01
    - ssh to the fucking k8s node name node01

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