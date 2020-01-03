#!/usr/bin/env python3
#
# Copyright (c) Bo Peng and the University of Texas MD Anderson Cancer Center
# Distributed under the terms of the 3-clause BSD License.

import glob
import os
import argparse
import json
import re
import sys


def fileDict(docFile, folder):
    docString = "var " + os.path.basename(folder) + "Dict={"
    for file in sorted(glob.glob(os.path.join(folder, "*.ipynb"))):
        name = file.replace(".ipynb", "").split("/")[-1]
        with open(file, encoding='utf-8') as json_data:
            try:
                d = json.load(json_data)
                title = d["cells"][0]["source"][0].replace(
                    " ", "-")[2:].strip() + "-1"
            except Exception as e:
                sys.exit('Failed to load "{}": {}'.format(file, e))
        # title=d["cells"]
        docString += '"' + title + '":"' + name + '",'
    docString = docString[:-1]
    docString += "}"
    # print (docString)
    docFile.write(docString + "\n")


def findImages(docFile, folder):
    docString = "var images=["
    for file in sorted(glob.glob(os.path.join(folder, "img", "banner_*"))):
        docString += '"' + os.path.basename(file) + '",'
    docString = docString[:-1]
    docString += "]"
    docFile.write(docString + "\n")


def generate_doc_toc(docs_dir):

    guideString = """var guides= [
    {
        header: 2,
        title: "SoS Notebook"
    }, """
    with open(os.path.join(docs_dir, "src", "homepage",
                           "notebook.ipynb")) as json_data:
        d = json.load(json_data)


    for cell in d["cells"]:
        for sentence in cell["source"]:
            guide = re.search(r'\[(.+?)(\(.*\)\s*)?\]\(doc/user_guide/(.+?).html\s*\)', sentence)
            if guide:
                guideString += f'''
    {{
        title: "{guide.group(1).strip().replace('`', '')}",
        name: "{guide.group(3)}"
    }},'''
            guide = re.search(r'##\s+(.+)', sentence)
            if guide:
                guideString += f'''
    {{
        header: 3,
        title: "{guide.group(1)}"
    }},
    '''

    guideString += '''
    {
        header: 2,
        title: "SoS Workflow"
    },
    '''
    with open(os.path.join(docs_dir, "src", "homepage",
                           "workflow.ipynb")) as json_data:
        d = json.load(json_data)
    for cell in d["cells"]:
        for sentence in cell["source"]:
            guide = re.search(r'\[(.+?)(\(.*\)\s*)?\]\(doc/user_guide/(.+?).html\s*\)', sentence)
            if guide:
                name = guide.group(1)
                guideString += f'''
    {{
        title: "{guide.group(1).strip().replace('`', '')}",
        name: "{guide.group(3)}"
    }},'''
            guide = re.search(r'##\s+(.+)', sentence)
            if guide:
                guideString += f'''
    {{
        header: 3,
        title: "{guide.group(1)}"
    }},'''

    guideString = guideString.strip()[:-1]
    guideString += "\n]"

    with open(os.path.join(docs_dir, "js", "docs.js"), "w") as docFile:
        findImages(docFile, docs_dir)
        docFile.write(guideString + "\n")
        docFile.close()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Search for names from SoS website')
    parser.add_argument(
        'docs_dir',
        metavar='DIR',
        help='''Path of the top SoS docs directory. This script will parse content of
        SoS notebooks files under $DOC_DIR (e.g. /src/documentation/*.ipynb), get
        the headers of the files, and write the results in $DOC_DIR/doc_toc.js
        ''')
    args = parser.parse_args()
    generate_doc_toc(args.docs_dir)
