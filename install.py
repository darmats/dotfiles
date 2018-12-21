import os
import shutil
import datetime
from subprocess import call

now = datetime.datetime.now().strftime("%Y%m%d%H%M%S")


class Command:
    def __init__(self):
        pass

    @staticmethod
    def exists(command):
        with open(os.devnull, "w") as f:
            ret = call(["command", "-v", command], stdout=f, stderr=f)
            return ret == 0


class Homebrew:
    missing = []

    def __init__(self):
        pass

    def add(self, name):
        self.missing.append(name)

    def install(self):
        if len(self.missing) > 0:
            call(["brew", "install"] + self.missing)


b = Homebrew()

if not Command.exists("brew"):
    print("Missing: homebrew")
    print("\tSee: https://brew.sh/index_ja")
    exit(0)

if not Command.exists("wget"):
    b.add("wget")
if not Command.exists("zsh"):
    b.add("zsh")
if not Command.exists("fish"):
    b.add("fish")

b.install()

if not os.path.isdir(os.path.expanduser("~/.config")):
    os.mkdir(os.path.expanduser("~/.config"))

if not Command.exists("composer"):
    if call(["sh", "%s/composer/download.sh" % os.getcwd()]) == 0:
        call(["mv", "%s/composer.phar" % os.getcwd(), "/usr/local/bin/composer"])
        call(["chmod", "+x", "/usr/local/bin/composer"])

if not os.path.isdir(os.path.expanduser("~/.composer")):
    os.mkdir(os.path.expanduser("~/.composer"))

# todo:
#   copy composer.json
#   run composer install
#   mkdir -p ~/repos/src/github.com/darmats
#   cd ~/repos/src/github.com/darmats
#   git clone https://github.com/darmats/sh.conf
#   brew install go
#   go get github.com/darmats/go-gitstatus/gitstatus
#   brew install tmux zplug
#       # curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
