
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Allow the next line of alias includes to be expanded
shopt -s expand_aliases

# include the sample aliases
. $DIR/sampleProfile.sh

samplesDir="$DIR/../samples"

commands=( grunt gulp jake rake gradle make )
exitCode=0

function getOutputForApproval {
	# executes $ (which is gulp, grunt, etc) and then cleans the output with some
	# regexes (mostly gulp cleanup) to avoid variying output for approval tests.
	eval $1 | sed -e 's/after.*μs/after ##.# μs/g' -e "s/Using gulpfile .*/Using gulpfile REMOVED/g" -e 's/\[..:..:..\] //g'
}

function runApprovalTest {
	testName=$1
	testCmd=$2
	testMsg=$3

	echo "*************************"
	echo "BEFORE TEST: $testName - $testMsg"
	OUTPUT=$(getOutputForApproval $2)
	echo "$OUTPUT"  | approvals "tests.$testName" --reporter gitdiff --outdir $DIR/testoutput "$@"
	localExit=$?
	if [ $localExit -gt 0 ]; then
		exitCode=1
	fi
	echo "AFTER TEST: $testName - exit: $localExit - $testMsg"
}


# Should pick selected command when there are two project types in one folder
cd "$samplesDir/multipleInOneSample"
npm install

runApprovalTest "multipleInOneSample.gulp" "gulp" "Should pick select command when there are 2 project types in one folder"

runApprovalTest "multipleInOneSample.grunt" "grunt" "Should pick select command when there are 2 project types in one folder"

for i in "${commands[@]}"
do
	fullCommand=$(which $i | grep -v commandAllThings | head -n 1)

	echo "*********************************"

	if [ -z "$fullCommand" ]; then
		echo "COMMAND: $i NOT installed. Skipping tests..."
	else

		testDir=$(cd "$samplesDir/${i}Sample"; pwd)

		echo "*** $i"
		echo "*** Expected Testing Dir: $testDir"

		cd $testDir

		echo "*** Current Directory : $(pwd)"

    for j in "${commands[@]}"
    do
			if [ -e "package.json" ]; then
	            npm install > /dev/null
			fi
#			echo "*** Executing: $i - $j"
			runApprovalTest "$i-$j" "$j" "TODO: (fill in msg?)"
#			OUTPUT=$(getOutputForApproval $j)
#			echo "$OUTPUT"  | approvals "tests.$i-$j" --reporter gitdiff --outdir $DIR/testoutput "$@"
#			localExit=$?
#			if [ $localExit -gt 0 ]; then
#				echo "SETTING FAILURE EXIT!"
#				exitCode=1
#			fi
#			echo "OUTPUT EXIT WITH: $localExit"
    done

	fi


done

echo "Exiting with code: $exitCode"
exit $exitCode
