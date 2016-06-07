# docker-overlayfs-pip
A simple dockerfile to reproduce the overlayfs bug with pip, as reported in https://github.com/pypa/pip/issues/2953 and https://github.com/docker/docker/issues/12327

If you run docker with `overlay` storage driver and kernel version < 4.5.0.-rc6 (which supposes resolved this bug via https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=45d11738969633ec07ca35d75d486bf2d8918df6), you will hit following error when run docker buil with this dockerfile: 
```
Exception:
Traceback (most recent call last):
  File "/usr/lib/python2.7/dist-packages/pip/basecommand.py", line 126, in main
  File "/usr/lib/python2.7/dist-packages/pip/commands/install.py", line 228, in run
  File "/usr/lib/python2.7/dist-packages/pip/req.py", line 1101, in install
  File "/usr/lib/python2.7/dist-packages/pip/req.py", line 488, in commit_uninstall
  File "/usr/lib/python2.7/dist-packages/pip/req.py", line 1415, in commit
  File "/usr/lib/python2.7/dist-packages/pip/util.py", line 29, in rmtree
  File "/usr/lib/python2.7/shutil.py", line 245, in rmtree
    rmtree(fullname, ignore_errors, onerror)
  File "/usr/lib/python2.7/shutil.py", line 245, in rmtree
    rmtree(fullname, ignore_errors, onerror)
  File "/usr/lib/python2.7/shutil.py", line 254, in rmtree
    onerror(os.rmdir, path, sys.exc_info())
  File "/usr/lib/python2.7/shutil.py", line 252, in rmtree
    os.rmdir(path)
OSError: [Errno 39] Directory not empty: '/tmp/pip-oMuCWu-uninstall/usr/bin'
 
Storing complete log in /root/.pip/pip.log
The command '/bin/sh -c pip install -U pip' returned a non-zero code: 2
```
