#!/bin/bash
read -p "Input topic: " topic

mkdir $topic
cd $topic

touch README.md
topicline="## "${topic}
headline1="## Mental Note"
headline2="## Practical Note"
newline="\n"

echo -e $topicline \
		$newline \
		$headline1 \
		$newline \
		$headline2 > README.md
