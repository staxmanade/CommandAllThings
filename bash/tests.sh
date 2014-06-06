
DIR="$( cd "$( dirname "$0" )" && pwd )"

# include the sample aliases
. $DIR/sampleProfile.sh

commands=( grunt gulp jake rake gradle make )

for i in "${commands[@]}"
do

	testDir=$(cd "$DIR/../samples/${i}Sample"; pwd)

	echo "*********************************"
	echo "*** $i"
	echo "*** Expected Testing Dir: $testDir"

	cd $testDir

	echo "*** Current Directory : $(pwd)"
	
    for j in "${commands[@]}"
    do
		if [ -e "package.json" ]; then
            npm install > /dev/null
		fi
		echo "*** Executing: $j"
	    eval $j
    done
done

