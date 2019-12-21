#!/bin/bash
echo "Taking params as a topic ..." 
topic=$1

mkdir $topic
cd $topic

touch README.md
process="\n ## General learning process \n - [ ] read();\n  - [ ] mentalRecall();\n - [ ] summaryRecall();\n  - [ ] mentalPracticalNote();\n  - [ ] readPractice() \n  - [ ] practiceSummary()"
topicline="# "${topic}
headline1="## Mental Note"
headline2="## Practical Note"
newline="\n"

echo -e $topicline \
		$process \
		$newline \
		$headline1 \
		$newline \
		$headline2 > README.md

echo $(pwd)
