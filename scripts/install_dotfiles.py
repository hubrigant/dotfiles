#!/usr/bin/env python3

"""
This is a port of the original install script that was written in zsh.
The intent in the port is to make my job as maintainer easier since
I am more familiar with python than zsh scripting.

During the port, I am also looking to refactor the code to make it
easier to understand and to enable installation through a curl/wget
command downloading just this script rather than having to start
with an existing clone of the repo.
"""

import os.path
import shutil
import subprocess
from pathlib import Path
#  import helpers

DOTFILES_REPO = "https://github.com/hubrigant/dotfiles"
DOTFILES_DIR = Path("~/.dotfiles2")
THEMES_ROOT = Path(DOTFILES_DIR / "themes")
PLUGINS_DIR = Path(DOTFILES_DIR / "plugins")
DOCS_DIR = Path(DOTFILES_DIR / "docs")
MASTERS_DIR = Path(DOTFILES_DIR / "config_masters")
DOTFILES_SETTINGS_DIR = Path(DOTFILES_DIR / "settings")
PREREQUISITES_CONFIG = Path(DOTFILES_SETTINGS_DIR / "prerequesites.yml")
GIT_PROGRAM = "git"

"""
First, determine if the repo has already been cloned and if not, clone it.
Two methods are tried. If the GitPython library is installed, use it.
Otherwise, if the git executable is installed, use that.
"""
if not DOTFILES_DIR.expanduser().exists():
    try:
        import git
        #  DOTFILES_REPO = git.Repo()
        print("It appears that GitPython has been installed.")
    except ModuleNotFoundError:
        #  TODO: code to clone dotfiles repo
        if lambda x: shutil.which(GIT_PROGRAM) is not None:
            print("GitPython module not installed, but found git executable.")
            try:
                retcode = subprocess.call("git" +
                                          " ".join([" clone ",
                                          DOTFILES_REPO,
                                          str(DOTFILES_DIR.expanduser().joinpath())]),
                        shell=True)
                if retcode < 0:
                    print("Child was terminated by signal", -retcode) #  , file=sys.stderr)
                else:
                    print("Child returned", retcode) #  , file=sys.stderr)
            except OSError as e:
                print("Execution failed:", e) #  , file=sys.stderr)
else:
    print("yay, the repo has already been cloned!")
