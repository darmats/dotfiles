import os
import datetime
from subprocess import call

now = datetime.datetime.now().strftime("%Y%m%d%H%M%S")


def exists(command):
    with open(os.devnull, "w") as f:
        ret = call(["command", "-v", command], stdout=f, stderr=f)
        return ret == 0


if not exists("brew"):
    print("Missing: homebrew")
