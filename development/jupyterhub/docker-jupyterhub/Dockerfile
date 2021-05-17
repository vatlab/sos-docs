FROM jupyterhub/jupyterhub:1.4.1
COPY requirements.txt /tmp/requirements.txt
RUN python3 -m pip install --no-cache -r /tmp/requirements.txt
COPY jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py
COPY cull_idle_servers.py /srv/jupyterhub/cull_idle_servers.py
