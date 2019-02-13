#!/usr/bin/env python3

import subprocess
import string
import random
import pexpect

def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
   return ''.join(random.choice(chars) for _ in range(size))

def push_changes():
    # commit the changes
    print(f'Pushing to branch {BRANCH}')
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
    if child.exitstatus != 0:
        print(child.before.decode())

def create_pull_request(msg='sos-docs updated from sos live server'):
    print('Creating pull request')
    child = pexpect.spawn(f'hub pull-request --base vatlab/sos-docs:master -m "{msg}"',
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
            child.close()
            break
    print(child.before.decode())

if __name__ == '__main__':
    DIR = '/home/jovyan/sos-docs'
    BRANCH = id_generator(6)

    print('Syncing with upstream master')
    subprocess.call('git fetch upstream master', cwd=DIR, shell=True, stderr=subprocess.DEVNULL, stdout=subprocess.DEVNULL)
    print(f'Creating a new branch {BRANCH}')
    subprocess.call(f'git checkout -b {BRANCH} FETCH_HEAD', cwd=DIR, shell=True, stderr=subprocess.DEVNULL, stdout=subprocess.DEVNULL)

    # get a list of changed files
    out = subprocess.check_output('git diff --name-only', cwd=DIR, shell=True).decode()

    # out should be something like
    #
    # src/user_guide/whatever.ipynb
    for file in out.splitlines():
        if file.startswith('src/') and file.endswith('.ipynb'):
            dest = file.replace('src', 'doc').replace('.ipynb', '.html')
            print(f'Converting {file}')
            subprocess.call(f'sos convert {DIR}/{file} {DIR}/{dest}  --template {DIR}/src/templates/sos-doc-with-banner.tpl',
                cwd=DIR, stderr=subprocess.DEVNULL, stdout=subprocess.DEVNULL, shell=True)

    print('Committing changes')
    subprocess.call(['git', 'commit', '.', '-m', f'Update {" ".join(out.splitlines())}'],
        stderr=subprocess.DEVNULL, stdout=subprocess.DEVNULL, cwd=DIR)

    push_changes()
    create_pull_request(msg=f'Update {" ".join(out.splitlines())} from live server')

