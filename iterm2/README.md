Open new iTerm2 tabs or panes which *cd* to current folder 
==========================================================

Bash scripts to be sourced from your `~/.bashrc` or `~/.bash_profile`. They provide functions to make iTerm2 open new tabs or new horizontal or vertical panes which automatically `cd` to current folder.

The new functions are called `new_tab`, `hsplit` and `vsplit`. By means of Applescript they trigger iTerm2 to open a new tab or make an horizontal or vertical split respectively, and then they make the new tab or pane automatically `cd` to the current working folder from where you executed the function.

Requirements
------------

* The Bash scripts rely on Applescript and need iTerm2 receiving commands from these scripts (it works by default on Mac OS X).


Installation
------------

* Place the `new_tab.sh`, `hsplit.sh` and `vsplit.sh` scripts in a folder with read permissions (e.g. `~/scripts`).
* Source them from your `.bash_profile` or `.bashrc` to have available the new functions.

```bash
### iTerm2 Bash scripts
# Open new_tab and cd to current folder
. ~/scripts/new_tab.sh

# Split vertically and cd to current folder
. ~/scripts/vsplit.sh

# Split horizontally and cd to current folder
. ~/scripts/hsplit.sh
```


Usage
-----
* Just execute `new_tab`, `hsplit` and `vsplit` from iTerm2.
* It also works on any other console (like Terminal), although the new tab or pane is always opened in last active iTerm2 window.


Troubleshooting
---------------
* hsplit and vsplit do not behave well when you have several iTerm2 windows opened.

