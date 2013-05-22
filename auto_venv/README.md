Automatic Virtualenv activation / deactivation
==============================================

Bash script to be sourced from your `~/.bashrc` or `~/.bash_profile` to enable automatic activation or deactivation of Virtualenvs.

Each time a folder is accessed (by means of `cd` command) the script will check if it belongs to a Virtualenv, either by the folder name or because a certain file indicates it. If no Virtualenv is found parent folders are checked recursively until a Virtualenv is found or root folder is reached.

Requirements
------------

* It only requires *virtualenv* to be installed on your system (not virtualenvwrapper). To activate or deactivate the Virtualenvs this script sources the `VENV_NAME/bin/activate` script or calls the `deactivate`.
* All existing Virtualenvs must be stored inside the same folder


Installation
------------

* Place the `auto_venv.sh` script in a folder with read permissions (e.g. `~/bin`)
* Source it from your `.bash_profile` or `.bashrc` to replace default `cd` behavior:

```bash
# Enable automatic Virtualenv activation / deactivation
. ~/bin/auto_venv.sh
```

* Before this line of code add all the required configuration variables (see next section)


Configuration
-------------
Declare the following variables before sourcing the script:
* *VENV_FILE*: Filename used to detect the Virtualenv to activate inside any folder (`.venv` by default).
* *VENV_ROOT*: Full path to the folder where Virtualenvs are stored / installed (`/Users/$USER/venvs` by default).

Example:

```bash
VENV_ROOT="/home/$USER/.virtualenvs"
VENV_FILE=".folder_venv"
# Enable automatic Virtualenv activation / deactivation
. ~/bin/auto_venv.sh
```

Usage
-----
Just `cd` a folder (or subfolder of) with the same name that a Virtualenv:

```bash
me@mylaptop:~$ ls ~/venvs/
    apis     projectXweb dashboard  vmining
me@mylaptop:~$ cd wspace/projectXweb/axr/
   ACTIVATED Virtualenv 'projectXweb'
[projectXweb]me@mylaptop:~/wspace/projectXweb/axr (master)$
[projectXweb]me@mylaptop:~/wspace/projectXweb/axr (master)$ cd
 DEACTIVATED Virtualenv 'projectXweb'
me@mylaptop:~$ cd wspace/projectXweb/
   ACTIVATED Virtualenv 'projectXweb'
[projectXweb]me@mylaptop:~/wspace/projectXweb (master)$ cd ..
 DEACTIVATED Virtualenv 'projectXweb'
```

Alternatively you can place a file defining the Virtualenv to be activated that folder:

```bash
me@mylaptop:~/wspace$ cd smartbilling/
   ACTIVATED Virtualenv 'apis'
[apis]me@mylaptop:~/wspace/smartbilling (master)$ cat .venv
apis
[apis]me@mylaptop:~/wspace/smartbilling (master)$ cd ../dashboard/
 DEACTIVATED Virtualenv 'apis'
   ACTIVATED Virtualenv 'dashboard'
[dashboard]me@mylaptop:~/wspace/dashboard$ cat .venv
cat: .venv: No such file or directory
```

If you change the enabled virtualenv manually and you want to trigger again automatic virtualenv activation, just execute `auto_venv` or `cd` any folder:

```bash
[projectX]me@mylaptop:~/wspace/projectX/trunk/backend/projectX-api$ deactivate 
me@mylaptop:~/wspace/projectX/trunk/backend/projectX-api$ auto_venv
   ACTIVATED Virtualenv 'projectX'
[projectX]me@mylaptop:~/wspace/projectX/trunk/backend/projectX-api$ 
```

```bash
[projectX]me@mylaptop:~/wspace/projectX/trunk/backend/projectX-api$ cd
 DEACTIVATED Virtualenv 'projectX'
me@mylaptop:~$ source venvs/kpis/bin/activate
[kpis]me@mylaptop:~$ auto_venv
 DEACTIVATED Virtualenv 'kpis'
me@mylaptop:~$ 
```
