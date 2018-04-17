#!/usr/bin/env bash

# Recursively git pull all subfolders
function git_update_all
{
    for folder in $(ls -d */);
    do
        cd $folder;
        branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
        branch_name="(unnamed branch)"     # detached HEAD
        branch_name=${branch_name##refs/heads/}
        echo "- UPDATING GIT ON $folder BRANCH $branch_name";
        git pull;
        echo "DONE GIT UPDATE ON $folder";
        echo;
        cd ..;
    done
}

