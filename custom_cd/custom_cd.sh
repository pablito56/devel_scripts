#!/usr/bin/env bash

if [ -z "$WSPACE_FOLDER" ]; then
    WSPACE_FOLDER="/Users/$USER/wspace"
fi

# Change folder in a customized way
# If no folder is provided and current pwd is inside a project
# (inside a subfolder of $WSPACE_FOLDER) then we cd to the project root
# (we cd to the subfolder of $WSPACE_FOLDER)
function custom_cd
{
    if [ -z "$@" ]; then
        DEST_FOLDER=$PWD 
#         echo "Looking for '$WSPACE_FOLDER' inside '$DEST_FOLDER'"
        while [ "$DEST_FOLDER" != "/" ]; do
            PARENT_FOLDER=$(dirname $DEST_FOLDER)
#             echo "Inside loop. '$DEST_FOLDER' vs. '$WSPACE_FOLDER'"
            if [ "$PARENT_FOLDER" == "$WSPACE_FOLDER" ] && [ "$DEST_FOLDER" != "$PWD" ]; then
                cd "$DEST_FOLDER"
                return
            fi
            DEST_FOLDER="$PARENT_FOLDER"
        done
        cd
    else
        cd "$@"
    fi
}

alias cd="custom_cd"
