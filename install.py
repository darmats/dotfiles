import os
import datetime
from subprocess import call

now = datetime.datetime.now().strftime("%Y%m%d%H%M%S")


def exists(command):
    f_null = open(os.devnull, "w")
    ret = call(["command", "-v", command], stdout=f_null, stderr=f_null)
    return ret == 0


if not exists("brew"):
    print("Missing: homebrew")
