

This jupyterhub installation allows users to update SoS documentation from the live server.

## Basic idea

1. Add a button to the top right of each page. Clicking the button triggers a [`editme` function](https://github.com/vatlab/sos-docs/blob/master/src/templates/parts/edit_button.tpl#L43) that opens the corresponding page on the live server.

2. The link has URL `http://server:8000/hub/user-redirect/path-to-filename.ipynb`, which will be be re-directed to the path after user logged in.

3. The JupyterHub server is run from a [docker image](https://github.com/vatlab/sos-docs/tree/master/development/jupyterhub/docker-jupyterhub), which is adapted from the [simple example of `dockerspanwer`](https://github.com/jupyterhub/dockerspawner/tree/master/examples/simple).

4. This docker spawner spawns a docker image [mdabioinfo:sos-docs](https://github.com/vatlab/sos-docs/blob/master/development/jupyterhub/docker-jupyterhub/jupyterhub_config.py#L17). It also [mounts `/home/sos/sos-docs` to the docker image](https://github.com/vatlab/sos-docs/blob/master/development/jupyterhub/docker-jupyterhub/jupyterhub_config.py#L29).

5. The `mdabioinfo:sos-docs` image is derived from `mdabioinfo:sos-demo`, and has the [github cli installed](https://github.com/vatlab/sos-docs/blob/master/development/jupyterhub/docker-sos-docs/Dockerfile#L11). It also [installs a script `create-pr`](https://github.com/vatlab/sos-docs/blob/050bec840129c437f5401e527094db17c6b2ff7a/development/jupyterhub/docker-sos-docs/Dockerfile#L13)

6. The [`create-pr`](https://github.com/vatlab/sos-docs/blob/master/development/jupyterhub/docker-sos-docs/create-pr) script is supposed to be executed by users after the notebook has been modified. It

  * fetch and merge upstrea (this should be done before user starts editing files?)
  * creates a new branch with a random name
  * run the `update-website` sos script to generate HTML files (can be made more efficient by only converting the changed file)
  * commit the change
  * create pull request (Does not work now because of credential issue)

## Deplyment

The paths etc are hard coded for our live server but should be easy to change if we are to
migrate to another server. 

0. Log on to the server, make sure `docker` is installed and running (run `docker ps` to check). Removing any existing
docker instanced with commands

```
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
```

1. Check out `sos-docs` repository or update to the latest master
```
git clone https://github.com/vatlabsos-docs.git
```

2. Set up sos-docs docker image

```
cd development/jupyterhub
docker build --no-cache -t mdabioinfo/sos-docs docker-sos-docs
```

3. Set up jupyterhub docker image

```
docker build --no-cache -t hub docker-jupyterhub
```

4. Create docker network

```
docker network create jupyterhub
```

5. Run the server

```
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock --net jupyterhub --name jupyterhub -p 8000:8000 hub
```

6. On the client side

Test URL:

```
http://localhost:8000/hub/user-redirect/notebooks/src/user_guide/sos_in_notebook.ipynb
```

7. After changing the doc, save, and run

```
!create-pr
```
