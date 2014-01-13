*last_secure_shell* command to repeat last ssh
==============================================

Bash script to be sourced from your `~/.bashrc` or `~/.bash_profile` to create a custom `last_secure_shell` which will repeat last executed *ssh* command. It also replaces *ssh* command with an alis (to store the call arguments used)


Requirements
------------

* *ssh* command


Installation
------------

* Place the `last_secure_shell.sh` script in a folder with read permissions (e.g. `~/bin`)
* Source it from your `.bash_profile` or `.bashrc` to replace default `ssh` behavior and create `last_secure_shell` command:

```bash
# Enable last_secure_shell command
. ~/bin/last_secure_shell.sh
```


Usage
-----
Just execute `last_secure_shell` after executing `ssh` (in the same or any other Bash session):

```bash
me@mylaptop:~$ ssh whoever@wherever
Last login: Mon Jan 10 18:07:21 2014 from any_other_host
...
me@mylaptop:~$ last_secure_shell
Last login: Mon Jan 13 08:48:37 2014 from your_host
...
```
