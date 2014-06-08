
DIR="$( cd "$( dirname "$0" )" && pwd )"

function rake { originallyCalledWith='rake'; "$DIR/commandAllThings.sh" "$@"; }
function grunt { originallyCalledWith='grunt'; "$DIR/commandAllThings.sh" "$@"; }
function gulp { originallyCalledWith='gulp'; "$DIR/commandAllThings.sh" "$@"; }
function make { originallyCalledWith='make'; "$DIR/commandAllThings.sh" "$@"; }
function gradle { originallyCalledWith='gradle'; "$DIR/commandAllThings.sh" "$@"; }
function jake { originallyCalledWith='jake'; "$DIR/commandAllThings.sh" "$@"; }
