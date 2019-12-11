#!/bin/bash
echo "about to re-start " $1
multipass stop $1
multipass start $1