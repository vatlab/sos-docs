#!/usr/bin/env python3
#
# This file is part of Script of Scripts (sos), a workflow system
# for the execution of commands and scripts in different languages.
# Please visit https://github.com/vatlab/SOS for more information.
#
# Copyright (C) 2016 Bo Peng (bpeng@mdanderson.org)

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
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

        # remove special characters which might mess up js file
        #title = re.sub(r'[^a-zA-Z0-9_\.\-]', ' ', title)
        #
        # sear
        all_text = []
        
        for header in soup.find_all(re.compile('^h[1-6]$')):
            # remove special character
            part = re.sub(r'[^a-zA-Z0-9_\-=\'".,\\]', ' ', header.get_text()).replace('"', "'").strip() + "\n"
            part = re.sub(r'\s+', ' ', part)
            url2 = header.find('a')
            if url2 is None:
                tag = ''
            else:
                tag = url2['href']
                
            part = '{{"title": "{}", "text": "{}", "tags": "", "url": "{}"}}'.format(header.get_text(), part, url + tag)
            all_text.append(part)
    return all_text

def generate_tipue_content(docs_dir):

    # get a list of html files and their url
    documentations = glob.glob(os.path.join(docs_dir, 'doc', 'documentation', '*.html'))
    tutorials = glob.glob(os.path.join(docs_dir, 'doc', 'tutorials', '*.html'))
    examples = glob.glob(os.path.join(docs_dir, 'doc', 'examples', '*.html'))

    text = [parse_html(url, html) for (url, html) in [
            ('https://vatlab.github.io/sos-docs/', os.path.join(docs_dir, 'Overview.html')),
            ('https://vatlab.github.io/sos-docs/#features', os.path.join(docs_dir, 'Features.html')),
            ('https://vatlab.github.io/sos-docs/#runningsos', os.path.join(docs_dir, 'Running_SoS.html')),
            ('https://vatlab.github.io/sos-docs/#documentation', os.path.join(docs_dir, 'Documentation.html'))] + 
            [('https://vatlab.github.io/sos-docs/doc/documentation/{}'.format(os.path.basename(x)), x) for x in documentations] + 
            [('https://vatlab.github.io/sos-docs/doc/tutorials/{}'.format(os.path.basename(x)), x) for x in tutorials] + 
            [('https://vatlab.github.io/sos-docs/doc/examples/{}'.format(os.path.basename(x)), x) for x in examples]]
    # write the output to file.
    with open(os.path.join(docs_dir, 'tipuesearch', 'tipuesearch_content.js'), 'w') as out:
        out.write('''\
var tipuesearch = {{"pages": [
{}
]}};
'''.format(',\n'.join(sum(text, []))))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Index SoS website')
    parser.add_argument('docs_dir', metavar='DIR',
        help='''Path of the top SoS docs directory. This script will parse content of
        HTML files under $DOC_DIR (e.g. Overview.html, /doc/documentation/*.html), get
        the headers of the files, and write the results in $DOC_DIR/tipuesearch_content.hs
        ''')
    args = parser.parse_args()
    generate_tipue_content(args.docs_dir)
