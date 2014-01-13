#!/usr/bin/env bash

# Backup old ssh command
OLD_SSH_CMD="ssh"

function _retrieve_last_ssh_file
{
    if [ -z "$LAST_SSH_FILE" ]; then
        LAST_SSH_FILE="$HOME/.last_ssh_args"
    fi
}

function custom_ssh
{
    # Retrieve last ssh file
    _retrieve_last_ssh_file
    # Replace file content with executed command args
    echo "$*" > $LAST_SSH_FILE
    # Execute old_ssh command
    $OLD_SSH_CMD $*
}

# Replace ssh by custom_ssh
alias ssh=custom_ssh
EXP_NUM_LINES="1
"

function last_secure_shell
{
    # Retrieve last ssh file
    _retrieve_last_ssh_file
    # # Check last ssh file content
    # NUM_LINES=$(wc -l $LAST_SSH_FILE)
    # if [ "$NUM_LINES" -ne 1 ]; then
    #     echo "ERROR: No last ssh command args found"
    #     return 1
    # fi
    # Check that file exists
    if [ ! -f "$LAST_SSH_FILE" ]; then
        echo "ERROR: File '$LAST_SSH_FILE' does not exist"
        return 1
    fi
    LAST_SSH_ARGS=$(cat $LAST_SSH_FILE)
    # Retrieve last args retrieved
    if [ -z "$LAST_SSH_ARGS" ]; then
        echo "ERROR: No last ssh command args retrieved"
        return 1
    fi
    # Run last ssh command
    $OLD_SSH_CMD $LAST_SSH_ARGS
    return 0
}

