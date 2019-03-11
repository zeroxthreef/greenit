# greenit

Bad reddit clone experiment. Only reason it exists is to learn Pike & Pike ScriptRunner.

## Installation

You need to have installed ![pike_redis_client](https://github.com/dressupgeekout/pike_redis_client) and ![pike scriptrunner](https://github.com/hww3/scriptrunner).

Put those both in your ``/usr/local/lib/pike8.0/modules`` folder.

Once you've taken care of that, run the ``src/install.sh`` script and restart nginx.

One thing to note about configuration: SELECT 2 is hardcoded into 3 files. Globally (for psp files) the util.psp file contains a constant for this and the login.pike and logout.pike files also contain this constant. There would only be one file for this, but scriptrunner has some limitations that required this solution.

## License
MIT (though this may not be correct because of my usage of the scriptrunner SCGI file which is GPL/LGPL that I modified with a different shebang and log location)
