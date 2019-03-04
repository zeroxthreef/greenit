# greenit

Bad reddit clone experiment. Only reason it exists is to learn Pike & Pike ScriptRunner.

## Installation

You need to have installed ![pike_redis_client](https://github.com/dressupgeekout/pike_redis_client) and ![pike scriptrunner](https://github.com/hww3/scriptrunner).

Put those both in your ``/usr/local/lib/pike8.0/modules`` folder.

Once you've taken care of that, run the ``src/install.sh`` script and restart nginx.

## Licesne
* MIT (though this may not be correct because of my usage of the scriptrunner SCGI file which is GPL/LGPL that I modified with a different shebang and log location)
