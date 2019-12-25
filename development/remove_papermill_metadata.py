#!/usr/bin/env python
#
# Papermill leaves a bunch of meta data in the executed notebook, which is unuuitable for github
# This tool removes it
#
#

import sys
import argparse
import nbformat

def remove_papermill_metadata(notebook_file):
    nb = nbformat.read(notebook_file, nbformat.NO_CONVERT)

    # remove from notebook meta
    has_papermill_meta = False
    if nb.metadata.pop('papermill', None):
        has_papermill_meta = True

    for cell in nb.cells:
        # remove from cell meta
        if cell.metadata.pop('papermill', None):
            has_papermill_meta = True

    if len(nb.cells) > 0 and 'An Exception was encountered' in nb.cells[0].source:
        print(f'Notebook contains a papermill exception notice')

    if has_papermill_meta:
        with open(notebook_file, 'w') as out:
            nbformat.write(nb, out)
        print(f'Papermill metadata removed from {notebook_file}')
    else:
        print(f'No papermill metadata exists in {notebook_file}')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Remove meta data from provided jupyter notebook')
    parser.add_argument(
        'notebooks',
        nargs='+',
        help='''Notebooks to remove meta data. The result will be saved
            in place.''')
    args = parser.parse_args()
    for notebook in args.notebooks:
        remove_papermill_metadata(notebook)
