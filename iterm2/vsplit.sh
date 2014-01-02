#!/usr/bin/env bash

# Bash function executing an Applescript to
# open a new iTerm2 pane (vertical split) and cd to current folder
vsplit()
{
osascript -e "
tell application \"iTerm\"
 tell the first terminal
        tell application \"System Events\" to keystroke \"d\" using command down
  tell the current session
   write text \"cd '$(pwd)'\"
  end tell
 end tell
end tell"
}
