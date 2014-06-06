
DIR="$( cd "$( dirname "$0" )" && pwd )"

. $DIR/sampleProfile.sh




commands=( grunt gulp jake rake gradle make )
for i in "${commands[@]}"
do
	testDir=$(cd "$DIR/../samples/${i}Sample"; pwd)
	echo "***     Dir: $testDir"
	echo "*** TESTING: *** $i ***"
	cd $testDir
	echo "***     PWD: $(pwd)"
	
    for j in "${commands[@]}"
    do
		if [ -e "package.json" ]; then
            npm install > /dev/null
		fi
		echo "*** Running: $j"
	    eval $j
    done
done


