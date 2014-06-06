
DIR="$( cd "$( dirname "$0" )" && pwd )"

# execute the tests ( and also redirect stderr to stdout ) capturing output
OUTPUT=$($DIR/tests.sh 2>&1 | sed -e 's/after.*μs/after ##.# μs/g')

# remove the gulp timestamps

echo "$OUTPUT"  | approvals tests --outdir $DIR
