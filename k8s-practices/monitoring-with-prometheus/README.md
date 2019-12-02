## [katacoda-boxboat: Monitoring with Prometheus](https://www.katacoda.com/boxboat/courses/kubernetes-basic/module-6)
### Exporing stuff.
1. What is Prometheus?
  - CNCF, Monitoring project, which supports detailed, time-based stream of monitoring data.

2. The need of monitoring?
  - Track thing fails is hard.

3. What is the game of monitoring?
  - Data model: timestamp series of events, identify with metric name, label, times. Sample is. <metric name>{<label name>=<label value>, ...}.
  - Query language to view thing in different dimensions.

4. "You can rely on it when other parts of your infrastructure are broken, and you do not need to setup extensive infrastructure to use it." --> What does this mean?
  - This runs as standalone service. Something fail in infra does not have impact on Prometheus

### Exercising mental note.

#### Mental note
  - Use helm to install stuff
  - Check pods everything is fine
  - Deploy and run Prometheus: IP forward service
  - Prometheus Dashboard: setting up thing
  - Config Prometheus rule using yaml. and run with helm
  - Config alert to webhook service like slack, mail via yaml. and run with helm

#### Practical note
  - Helm 
    - helm init
    - helm repo update
    - helm install --name prometheus stable/prometheus  ** Currently having some errors
    - helm upgrade -f values.yaml prometheus stable/prometheus

  - Error when get pods.
    - `kubectl get pods -o wide`
    > STATUS CrashLoopBackOff
    - Means pod is start and crash all over. Hints: error with the containers *shrug

  - IP forward prometheus service
	- `kubectl port-forward --address 0.0.0.0 svc/prometheus-server 9090:80 > /dev/null &
	kubectl port-forward --address 0.0.0.0 svc/prometheus-alertmanager 9093:80 >/dev/null &`

  - config prometheus.

	` echo "serverFiles:
	  alerts:
	    groups:
	      - name: Instances
	        rules:
	          - alert: InstanceDown
	            expr: up == 0
	            for: 1m
	            labels:
	              severity: page
	            annotations:
	              description: '{{ $labels.instance }} of job {{ $labels.job }} has been down for more than 1 minute.'
	              summary: 'Instance {{ $labels.instance }} down'" > values.yaml `

  > Error: 
	UPGRADE FAILED
	ROLLING BACK
	Error: "prometheus" has no deployed releases
	Error: UPGRADE FAILED: "prometheus" has no deployed releases

-----

https://prometheus.io/docs/introduction/overview/
https://prometheus.io/docs/concepts/data_model/#samples
https://prometheus.io/docs/prometheus/latest/querying/basics/
https://hub.helm.sh/
https://helm.sh/


