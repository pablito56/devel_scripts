#!/usr/bin/env bash

# Bash function executing an Applescript to
# open a new iTerm2 pane (horizontal split) and cd to current folder
hsplit()
{
osascript -e "
tell application \"iTerm\"
 tell the first terminal
        tell application \"System Events\" to keystroke \"D\" using {command down, shift down}
  tell the current session
   write text \"cd $(pwd)\"
  end tell
 end tell
end tell"
}
