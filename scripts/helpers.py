#!/usr/bin/env python3

"""
This is a collection of helper functions in support of the python installer.
Some of them are purely supportive, the others implementing actual functionality
that was located in the original zsh script's monolithic program. It was
relocated to improve readability and maintainability during the porting
process.
"""

def which(program):
    import os
    def is_exe(fpath):
        return os.path.isfile(fpath) and os.access(fpath, os.X_OK)

    fpath, fname = os.path.split(program)
    if fpath:
        if is_exe(program):
            return program
    else:
        for path in os.environ["PATH"].split(os.pathsep):
            exe_file = os.path.join(path, program)
            if is_exe(exe_file):
                return exe_file

    return None
