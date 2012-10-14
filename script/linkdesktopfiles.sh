function GetBaseDir {
	pathTo=$1
	if [ -z "$pathTo" ]; then
		pathTo='.'
	fi

    local parentDir=$(dirname "$pathTo")
    cd "$parentDir"
    local absolutePath="$(pwd)"/"$(basename $pathTo)"
    cd - >/dev/null
    echo ${absolutePath%/*}
}

Dir="$(GetBaseDir)/../desktop"
TargetDir="/home/tobias/.local/share/applications"


cp --link --force "$Dir/"* "$TargetDir"
