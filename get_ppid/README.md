Function to retrieve PPID of a process
======================================

Bash function to retrieve the parent PID of a process (the current process if no input PID is provided).


Installation
------------

* Place the `ppid_function.sh` script in a folder with read permissions (e.g. `~/bin`)
* Source it from your `.bash_profile` or `.bashrc`:

```bash
# Import custom 'ppid' function
. ~/bin/ppid_function.sh
```


Usage
-----
Just execute `ppid` providing an optional PID as argument:

```bash
me@mylaptop:~$ source ppid_function.sh
me@mylaptop:~$ ppid
90009
me@mylaptop:~$ ppid 90009
  176
me@mylaptop:~$
```
