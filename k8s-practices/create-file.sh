#!/bin/bash
read -p "Input topic: " topic

mkdir $topic
cd $topic

touch README.md
process="\n ## General learning process \n - [ ] read();\n  - [ ] mentalRecall();\n - [ ] ummaryRecall();\n  - [ ] mentalPracticalNote();\n  - [ ] readPractice() \n  - [ ] practiceSummary()"
topicline="## "${topic}
headline1="## Mental Note"
headline2="## Practical Note"
newline="\n"

echo -e $topicline \
		$process \
		$newline \
		$headline1 \
		$newline \
		$headline2 > README.md
