Concepts: volumes, persistent volumes, persistent volume claim.

Recall: 
Volumes defines how a cluster provide storage, save data, get data etc. in a pod or a host.
 - I can mount pod volumes into host volume using `containers.volumeMount` and `volumes.hostPath.path`
 - I can provision Persistent Volume, which has more configured functions such as: Retain Policy, plan in storage to be used, define accessModes
 - If my cluster manage volume using Persistent Volume, Persistent Volume Claim is where I clarify again how I should use the amount of volume provided in my app, such as storage and access mode.
 
Lots of variations in volumes: 
 - storageClassName
 - emptyDir
 - cloud provider used

 **Git used**
- [Describe how a daemonset mount log directly into host path, using **[volumeMounts]** **[mountPath]** **[volumes]** **[hostPath]** **[path]** ](https://github.com/kubernetes/website/blob/03cbde63e8726479e41fdebf87ce02fee7892fc1/content/en/examples/controllers/daemonset.yaml)

- [Describe how to create kind: PersistentVolume and kind: PersistentVolumeClaim](https://github.com/kubernetes/website/blob/edb233cac2f4f910dd55311a3c63bdfbd53a081b/content/ja/examples/application/mysql/mysql-pv.yaml)

- [Describe how a Pod mount its volume mount using Persistent Volume Claim](https://github.com/kubernetes/website/blob/e174e794383c53c9f55c82f03e393d1ca93a015d/content/ja/examples/pods/storage/pv-pod.yaml)

 **References**
- [My mental note on storage concept](../round1/storage.concept/README.md)
- [My mental note on workflow using storage ](../round1/storage.config-pod-to-use-persistent-volume/README.md)
