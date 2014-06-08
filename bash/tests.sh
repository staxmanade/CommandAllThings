
DIR="$( cd "$( dirname "$0" )" && pwd )"

# include the sample aliases
shopt -s expand_aliases
. $DIR/sampleProfile.sh


commands=( grunt gulp jake rake gradle make )
installedCommands=()

exitCode=0

for i in "${commands[@]}"
do
	fullCommand=$(which $i | grep -v commandAllThings | head -n 1)

	echo "*********************************"

	if [ -z "$fullCommand" ]; then
		echo "COMMAND: $i NOT installed. Skipping tests..."
	else

		testDir=$(cd "$DIR/../samples/${i}Sample"; pwd)

		echo "*** $i"
		echo "*** Expected Testing Dir: $testDir"

		cd $testDir

		echo "*** Current Directory : $(pwd)"

    for j in "${commands[@]}"
    do
			if [ -e "package.json" ]; then
	            npm install > /dev/null
			fi
			echo "*** Executing: $i - $j"
			# execute the tests ( and also redirect stderr to stdout ) capturing output
			OUTPUT=$( eval $j | sed -e 's/after.*μs/after ##.# μs/g' -e "s/Using gulpfile .*/Using gulpfile REMOVED/g")

			echo "$OUTPUT"  | approvals "tests.$i-$j" --reporter gitdiff --outdir $DIR/testoutput "$@"
			localExit=$?
			if [ $localExit -gt 0 ]; then
				echo "SETTING FAILURE EXIT!"
				exitCode=1
			fi
			echo "OUTPUT EXIT WITH: $localExit"
    done

	fi


done

echo "Exiting with code: $exitCode"
exit $exitCode
