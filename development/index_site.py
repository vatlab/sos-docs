#!/usr/bin/env python3
#
# Copyright (c) Bo Peng and the University of Texas MD Anderson Cancer Center
# Distributed under the terms of the 3-clause BSD License.
#
import os
import glob
import re
import argparse
from bs4 import BeautifulSoup
'''
A simple script to create tipue content by searching for documentation
files under the top docs directory of the SoS website.
'''


def parse_html(url, html):
    print('Parsing {}'.format(html))
    with open(html, 'rb') as content:
        soup = BeautifulSoup(content, "html.parser", from_encoding='utf-8')
        #
        # try to get the title of the page from h1, h2, or title, and
        # uses filename if none of them exists.
        #
        title = soup.find('h1')
        if title is None:
            title = soup.find('h2')
        if title is None:
            title = soup.find('title')
        if title is None:
            title = os.path.basename(html).rsplit('.')[0]
        else:
            title = title.get_text()

        maintitle = soup.find('h1')
        if maintitle is None:
            maintitle = soup.find('h2')
        if maintitle is None:
            maintitle = soup.find('title')
        if maintitle is None:
            maintitle = os.path.basename(html).rsplit('.')[0]
        else:
            maintitle = maintitle.get_text()

        # remove special characters which might mess up js file
        title = re.sub(r'[¶^a-zA-Z0-9_\.\-]', ' ', title)
        #
        # sear
        all_text = []
        for header in soup.find_all(re.compile('^h[1-6]$')):
            # remove special character

            part = re.sub(r'[^a-zA-Z0-9_\-=\'".,\\]', ' ',
                          header.get_text()).replace('"', "'").strip() + "\n"
            part = re.sub(r'\s+', ' ', part)
            ids = [x for x in header.findAll('a') if x.get('id')]
            if ids:
                tag = '#' + ids[0].get('id')
            else:
                hrefs = header.findAll('a', {'class': 'anchor-link'})
                if hrefs:
                    tag = hrefs[0].get('href')
                else:
                    tag = ''

            part = '{{"mainTitle": "{}", "title": "{}", "text": "{}", "tags": "", "mainUrl": "{}", "url": "{}"}}'.format(
                maintitle.replace('¶', '').strip(),
                header.get_text().replace('¶', '').replace('"', r'\"').strip(),
                part, url, url + tag.replace('"', r'\"'))
            all_text.append(part)

    return all_text


def generate_tipue_content(docs_dir):

    # get a list of html files and their url
    documentations = glob.glob(
        os.path.join(docs_dir, 'doc', 'user_guide', '*.html'))

    text = [
        parse_html(url, html)
        for (url, html) in [('https://vatlab.github.io/sos-docs/',
                             os.path.join(docs_dir, 'index.html')),
                            ('https://vatlab.github.io/sos-docs/running.html',
                             os.path.join(docs_dir, 'running.html')),
                            ('https://vatlab.github.io/sos-docs/notebook.html',
                             os.path.join(docs_dir, 'notebook.html')),
                            ('https://vatlab.github.io/sos-docs/workflow.html',
                             os.path.join(docs_dir, 'workflow.html'))] +
        [('https://vatlab.github.io/sos-docs/doc/user_guide/{}'.format(
            os.path.basename(x)), x) for x in documentations]
    ]
    # write the output to file.
    with open(
            os.path.join(docs_dir, 'tipuesearch', 'tipuesearch_content.js'),
            'w') as out:
        out.write('''\
var tipuesearch = {{"pages": [
{}
]}};
'''.format(',\n'.join(sum(text, []))))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Index SoS website')
    parser.add_argument(
        'docs_dir',
        metavar='DIR',
        help='''Path of the top SoS docs directory. This script will parse content of
        HTML files under $DOC_DIR (e.g. Overview.html, /doc/documentation/*.html), get
        the headers of the files, and write the results in $DOC_DIR/tipuesearch_content.hs
        ''')
    args = parser.parse_args()
    generate_tipue_content(args.docs_dir)
