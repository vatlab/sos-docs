

## Set up sos-docs docker image

```
docker build --no-cache -t mdabioinfo/sos-docs docker-sos-docs
```

## Set up jupyterhub docker image

```
docker build --no-cache -t hub docker-jupyterhub
```

## Create docker network

```
docker network create jupyterhub
```

## Run the server

```
sh run.sh
```

## On the client side

Test URL:

```
http://localhost:8000/hub/user-redirect/notebooks/docs/user_guide/sos_in_notebook.ipynb

```
