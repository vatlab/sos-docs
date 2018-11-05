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
    docString="var " + os.path.basename(folder) + "Dict={"
    for file in sorted(glob.glob(os.path.join(folder, "*.ipynb"))):
        name=file.replace(".ipynb", "").split("/")[-1]
        with open(file, encoding='utf-8') as json_data:
             try:
                 d=json.load(json_data)
                 title=d["cells"][0]["source"][0].replace(" ","-")[2:].strip()+"-1"
             except Exception as e:
                sys.exit('Failed to load "{}": {}'.format(file, e))
         # title=d["cells"]
        docString+='"'+title+'":"'+name+'",'
    docString=docString[:-1]
    docString+="}"
    # print (docString)
    docFile.write(docString+"\n")


def findImages(docFile, folder):
    docString="var images=["
    for file in sorted(glob.glob(os.path.join(folder, "img", "banner_*"))):
        docString += '"'+os.path.basename(file)+'",'
    docString=docString[:-1]
    docString+="]"
    docFile.write(docString+"\n")

def generate_doc_toc(docs_dir):

    tutString="var tutorials=["
    docString="var documentation=["
    with open(os.path.join(docs_dir, "src", "homepage", "Notebook_Documentation.ipynb")) as json_data:
         d = json.load(json_data)
    for cell in d["cells"]:
        for sentence in cell["source"]:
            tut=re.search('doc/tutorials/(.+?).html',sentence)
            if tut:
                name=tut.group(1)
                tutString+='"'+name+'", '
            doc=re.search('doc/documentation/(.+?).html',sentence)
            if doc:
                name=doc.group(1)
                docString+='"'+name+'", '
    with open(os.path.join(docs_dir, "src", "homepage", "Workflow_Documentation.ipynb")) as json_data:
         d = json.load(json_data)
    for cell in d["cells"]:
        for sentence in cell["source"]:
            tut=re.search('doc/tutorials/(.+?).html',sentence)
            if tut:
                name=tut.group(1)
                tutString+='"'+name+'", '
            doc=re.search('doc/documentation/(.+?).html',sentence)
            if doc:
                name=doc.group(1)
                docString+='"'+name+'", '
    tutString=tutString[:-2]
    tutString+="]"
    docString=docString[:-2]
    docString+="]"

    with open(os.path.join(docs_dir, "js", "docs.js"), "w") as docFile:
        fileDict(docFile, os.path.join(docs_dir, "src", "documentation"))
        fileDict(docFile, os.path.join(docs_dir, "src", "tutorials"))
        findImages(docFile, docs_dir)
        docFile.write(docString+"\n")
        docFile.write(tutString+"\n")
        docFile.close()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Search for names from SoS website')
    parser.add_argument('docs_dir', metavar='DIR',
        help='''Path of the top SoS docs directory. This script will parse content of
        SoS notebooks files under $DOC_DIR (e.g. /src/documentation/*.ipynb), get
        the headers of the files, and write the results in $DOC_DIR/doc_toc.js
        ''')
    args = parser.parse_args()
    generate_doc_toc(args.docs_dir)
