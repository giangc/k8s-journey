## Taint-N-Tolerations 
- Fitler operations which helps Schedulers to schedule Pod(allocate VM, spreading, etc.).

## Mental Note 
    - Config taint via kubectl or PodSpec(yaml)
    - Understand key and value: matching value for Pod to be tolerated by Taint or or not.
    - Know what is operations: Exist(match with all exist: key or non-key) or Equal
    - Use cases of Taint would be: specific hardware specs node, dedicated node, tested node.

## Practical Note
- `kubectl taint nodes node1 key=value:NoSchedule`
- `kubectl taint nodes node1 key:NoSchedule-`

#Quiz
1. What is taint?
2. Create sample taint via kubectl?
3. How do I config toleration via PodSpec?
