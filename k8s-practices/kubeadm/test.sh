#!/bin/bash
# printing() {
#     NODES=$(echo worker{1..2});
#     for NODE in ${NODES};
#     do echo "Hello ${NODE}";
#     done;
# }

# creatingNodes() {
#     NODES=$(echo worker{1..2});
#     for NODE in ${NODES}; 
#     do multipass launch --name ${NODE} --cpus 2 --mem 2G --disk 8G;
#     done;
# }

# export -f creatingNodes
# export -f printing
# multipass delete worker1 | multipass purge | multipass list
# multipass launch ubuntu --name worker1 --cpus 2 --disk 4G;
NODES=$(echo worker{1..2});
    for NODE in ${NODES}; 
    do multipass launch ubuntu --name ${NODE} --disk 4G;
    done;
    