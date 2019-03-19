# greenit

![greenit logo](https://raw.githubusercontent.com/zeroxthreef/greenit/master/src/html/img_res/greenit.png)

Bad reddit clone experiment. Only reason it exists is to learn Pike & Pike ScriptRunner.

## Installation

You need to have installed ![pike_redis_client](https://github.com/dressupgeekout/pike_redis_client) and ![pike scriptrunner](https://github.com/hww3/scriptrunner).

(you might need to use my fork of pike redis client that uses unix domain sockets)

Put those both in your ``/usr/local/lib/pike8.0/modules`` folder.

VERY IMPORTANT: you will need to add the standard letsencrypt stuff to the nginx .conf file if you wanna listen to any other port than 8000 and also ssl.

Once you've taken care of that, run the ``src/install.sh`` script (as root) and restart nginx.

You will also need to modify the Pike ScriptRunner SCGI script and remove the first line, then replace it with ``#!/usr/bin/pike``. Rename that pike script file to ``ScriptRunner_SCGI.pike``, and move it to ``/usr/local/bin``.

One thing to note about configuration: SELECT 2 is hardcoded into 3 files. Globally (for psp files) the util.psp file contains a constant for this and the login.pike and logout.pike files also contain this constant. There would only be one file for this, but scriptrunner has some limitations that required this solution.

## License
MIT
