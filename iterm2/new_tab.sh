#!/usr/bin/env bash

# Bash function executing an Applescript to
# open a new iTerm2 tab and cd to current folder
new_tab()
{
osascript -e "
tell application \"iTerm\"
 tell the last terminal
  launch session \"Default Session\"
  tell the last session
   write text \"cd '$(pwd)'\"
  end tell
 end tell
end tell"
}

