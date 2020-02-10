# pod.scheduled.label-and-selector 
 https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
 
 ## General learning process 
 - [x] read();
 - [x] mentalRecall();
 - [x] summaryRecall();
 - [ ] mentalPracticalNote();
 - [ ] readPractice() 
 - [ ] practiceSummary()

 ## Mental Note 
 - Label and selector are key value pair attached to k8s object, basically it's like a tag, and used for cross referencing.
 - Label and selector is used to 
    - reference objects, which is multi-dimensional.
    - select via kubectl.
 - There are subtle ways to use label and selectors, which could be: set-based, equality based or equality based.

 ## Practical Note
  
  ```
  "metadata": {
  "labels": {
    "key1" : "value1",
    "key2" : "value2"
    }
  }
  ```
  