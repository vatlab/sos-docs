#!/usr/bin/env python3

import subprocess
import string
import random
import pexpect

def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
   return ''.join(random.choice(chars) for _ in range(size))

def push_changes():
    # commit the changes
    print(f'\n\nPushing branch {BRANCH}\n')
    child = pexpect.spawn(f'git push origin {BRANCH}', cwd=DIR)
    while True:
        prompt = child.expect([
            "Username for 'https://github.com':",
            "Password for 'https://sosdocs@github.com':",
            pexpect.EOF]
        )
        if prompt == 0:
            child.sendline('sosdocs')
        elif prompt == 1:
            child.sendline('PASSWORD')
        elif prompt == 2:
            child.close()
            break
    print(child.before.decode())

def create_pull_request():
    print('\n\nCreating pull request\n')
    child = pexpect.spawn(f'hub pull-request --base vatlab/sos-docs:master -m "sos-docs updated from sos live server"',
        cwd=DIR)
    while True:
        prompt = child.expect([
            "github.com username:\s*",
            r"github.com password for sosdocs \(never stored\):\s*",
            pexpect.EOF]
        )
        if prompt == 0:
            child.sendline('sosdocs')
        elif prompt == 1:
            child.sendline('PASSWORD')
        elif prompt == 2:
            print(child.before.decode())
            child.close()
            break
    print(child.before.decode())

if __name__ == '__main__':
    DIR = '/home/jovyan/sos-docs'
    BRANCH = id_generator(6)

    print('\nSyncing with upstream master...\n')
    subprocess.call('git fetch upstream master', cwd=DIR, shell=True)
    subprocess.call(f'git checkout -b {BRANCH} FETCH_HEAD', cwd=DIR, shell=True)

    # get a list of changed files
    out = subprocess.check_output('git diff --name-only', cwd=DIR, shell=True).decode()

    # out should be something like
    #
    # src/user_guide/whatever.ipynb
    for file in out.splitlines():
        if file.startswith('src/') and file.endswith('.ipynb'):
            dest = file.replace('src', 'doc').replace('.ipynb', '.html')
            print(f'Converting {file} to {dest}')
            subprocess.call(f'sos convert {DIR}/{file} {DIR}/{dest}  --template {DIR}/src/templates/sos-doc-with-banner.tpl',
                cwd=DIR, shell=True)

    subprocess.call(['git', 'commit', '.', '-m', 'Update {" ".join(out.splitlines())}'],
        cwd=DIR)

    push_changes()
    create_pull_request()

