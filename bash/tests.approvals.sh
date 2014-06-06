
DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "Please wait (this may take a moment)..."

# execute the tests ( and also redirect stderr to stdout ) capturing output
OUTPUT=$($DIR/tests.sh 2>&1 | sed -e 's/after.*μs/after ##.# μs/g')


echo "$OUTPUT"  | approvals tests --outdir $DIR "$@"
