*cd* to your current project folder instead of your home
========================================================

Bash script to be sourced from your `~/.bashrc` or `~/.bash_profile` to customise *cd* command to access your current project root folder instead of your home when doing `cd`.

The script assumes you have all projects stuff as subfolders of a certain folder (e.g. `/home/$USER/wspace`). Each time `cd` is executed without an additional argument the script will check if your current working directory is inside a subfolder of your projects root folder. In this case the script will cd to this subfolder instead of your home. 


Requirements
------------

* All your projects must be stored inside the same folder (e.g. `/home/$USER/wspace`)


Installation
------------

* Place the `custom_cd.sh` script in a folder with read permissions (e.g. `~/bin`)
* Source it from your `.bash_profile` or `.bashrc` to replace default `cd` behavior:

```bash
# Enable custom cd command to consider project root as home
. ~/bin/custom_cd.sh
```

* Before this line of code add all the required configuration variables (see next section)


Configuration
-------------
Declare the following variables before sourcing the script:
* *WSPACE_FOLDER*: Your projects root folder. Each of its subfolders should contain project files (`/Users/$USER/wspace` by default).

Example:

```bash
WSPACE_FOLDER="/home/$USER/worspace"
# Enable custom cd command to consider project root as home
. ~/bin/custom_cd.sh
```

Usage
-----
Just execute `cd` inside subfolders of any project:

```bash
me@mylaptop:~$ cd wspace/devel_scripts/custom_cd
me@mylaptop:~/wspace/devel_scripts/custom_cd$ cd
me@mylaptop:~/wspace/devel_scripts$ cd
me@mylaptop:~$
```
