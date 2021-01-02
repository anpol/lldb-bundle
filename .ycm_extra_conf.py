#!/usr/bin/env python3
#
# This script is for YouCompleteMe <https://github.com/ycm-core/YouCompleteMe>.

import subprocess
import shlex


def _xcrun(args):
    command = ['xcrun'] + shlex.split(args)
    return subprocess.check_output(command, encoding='utf-8').rstrip('\n')


def Settings(**kwargs):
    return {
        'interpreter_path': _xcrun('--find python3'),
        'sys_path': _xcrun('lldb --python-path').split(':'),
    }


if __name__ == '__main__':
    print(Settings())
