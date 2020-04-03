#!/bin/bash

if [[ $1 =~ ^(triangle|monopoly|chess|validator|cli)$ ]]; then
	echo "Running VarexC to generate BDDs for" $1
else 
	echo "Usage: $0 [triangle | monopoly | chess | validator | cli] "
	exit 1
fi

if [[ -d "lifted" ]]
then
	rm -r lifted
fi

case $1 in 
	monopoly)
		echo "Might take up to 3 hours to finish..."
		java -Xmx12g -cp monopoly-vbc.jar edu.cmu.cs.vbc.testutils.MonopoliForkTestLauncher monopoly-vbc.jar monopoly.jar &> /dev/null
		;;
	chess)
		echo "Might take 2 to 3 hours to finish..."
		java -Xmx12g -cp chess-vbc/vbc.jar edu.cmu.cs.vbc.testutils.ChessForkTestLauncher chess-vbc/vbc.jar chess.jar &> /dev/null
		;;
	validator)
		echo "Might take 1 to 2 hours to finish..."
		java -Xmx12g -cp vbc.jar edu.cmu.cs.vbc.testutils.ValidatorTestLauncher validator.jar &> /dev/null
		;;
	triangle)
		echo "Will finish in a few minutes..."
		java -Xmx12g -cp vbc.jar edu.cmu.cs.vbc.testutils.TriangleTestLauncher &> /dev/null
		;;
	cli)
		echo "Might take 1 to 2 hours to finish..."
		java -Xmx12g -cp vbc.jar edu.cmu.cs.vbc.testutils.CLIForkTestLauncher vbc.jar cli.jar &> /dev/null
		;;
esac

if [[ -d "lifted" ]]
then
	rm -r lifted
fi

echo "Finished variational execution." 
echo "BDDs are written as txt files in the current folder, one file per test case."
