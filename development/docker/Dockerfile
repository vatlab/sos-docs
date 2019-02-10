# Copyright (c) Bo Peng and the University of Texas MD Anderson Cancer Center
# Distributed under the terms of the 3-clause BSD License.

FROM mdabioinfo/sos-demo:latest

MAINTAINER Bo Peng <bpeng@mdanderson.org>

USER    root

# install github cli tool
RUN     cd /opt && wget https://github.com/github/hub/releases/download/v2.8.4/hub-linux-amd64-2.8.4.tgz && tar zxf hub-linux-amd64-2.8.4.tgz; ln -s /opt/hub-linux-amd64-2.8.4/bin/hub /usr/bin/hub

COPY    create-branch /usr/local/bin
COPY    create-pr /usr/local/bin
RUN     chmod +x /usr/local/bin/create-branch
RUN     chmod +x /usr/local/bin/create-pr

USER    jovyan
