## Job
- [github/dgkanatsios: Pod design - Job](https://github.com/dgkanatsios/CKAD-exercises/blob/master/c.pod_design.md)
- [K8s Doc: CronJob](https://kubernetes.io/docs/tasks/job/automated-tasks-with-cron-jobs/)
- [K8s Doc: Job](https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/)

## Mental Note
- Check pod name
- Check output of pod via `kubectl logs`

## Practical Note
- `kubectl apply -f https://k8s.io/examples/controllers/job.yaml`
- `kubectl logs jobpod1`
- Error: `field is immutable` -> which probably means you have to re-create it