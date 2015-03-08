
DIR="$( cd "$( dirname "$0" )" && pwd )"

function rake { export originallyCalledWith='rake'; "$DIR/commandAllThings.sh" "$@"; }
function grunt { export originallyCalledWith='grunt'; "$DIR/commandAllThings.sh" "$@"; }
function gulp { export originallyCalledWith='gulp'; "$DIR/commandAllThings.sh" "$@"; }
function make { export originallyCalledWith='make'; "$DIR/commandAllThings.sh" "$@"; }
function gradle { export originallyCalledWith='gradle'; "$DIR/commandAllThings.sh" "$@"; }
function jake { export originallyCalledWith='jake'; "$DIR/commandAllThings.sh" "$@"; }
function xbuild { export originallyCalledWith='xbuild'; "$DIR/commandAllThings.sh" "$@"; }
