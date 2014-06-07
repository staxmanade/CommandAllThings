
DIR="$( cd "$( dirname "$0" )" && pwd )"

# include the sample aliases
. $DIR/sampleProfile.sh

commands=( grunt gulp jake rake gradle make )
installedCommands=()

exitCode = 0

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
			OUTPUT=$( eval $j | sed -e 's/after.*μs/after ##.# μs/g')
			echo "$OUTPUT"  | approvals "tests.$i-$j" --outdir $DIR/testoutput "$@"
			if [ $? -gt 0 ]; then
				exitCode=1
			fi
    done

	fi


done

exit $exitCode
