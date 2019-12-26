#!/usr/bin/env python
#

# HTML file contains the following links, which does not work and should be removed.
#
# Notebook saved to <a href="{filename}" target="_blank">{filename}</a>
#
# Cell content saved to <a href="{filename}" target="_blank">{filename}</a>
#

import argparse
import re

def remove_saved_to_links(page):
    with open(page) as html:
        content = html.readlines()

    with open(page, 'w') as html:
        for line in content:
            html.write(re.sub(
                 r'Notebook saved to <a href="(.*)" target="_blank">(.*)</a>',
                 r'Notebook saved to <b>\1</b>',
                 re.sub(
                 r'Cell content saved to <a href="(.*)" target="_blank">(.*)</a>',
                 r'Cell content saved to <b>\1</b>',
                 line)))

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Remove save to links provided HTML file')
    parser.add_argument(
        'pages',
        nargs='+',
        help='''HTML files with potential links. The result will be saved
            in place.''')
    args = parser.parse_args()
    for page in args.pages:
        remove_saved_to_links(page)
