# Robotics docker image

This image is hosted at [Docker Hub](https://hub.docker.com/r/toto04/robotics).

## Usage

Clone this repository:

```bash
git clone https://github.com/toto04/robotics
cd robotics
```

then spint up the container as a daemon (for the first time this will take a while, as it will download the image):

```bash
docker compose up -d
```

and then you can exec into the container:

```bash
docker exec -it robotics bash
```

A folder `mount` will be created in this folder that will be mounted in the
container at `/root/robotics/`.

NoVNC display will be available at [`http://localhost:8080/vnc.html`](http://localhost:8080/vnc.html).

To stop the container, you can do:

```bash
docker compose down
```

## Building

If you want to build the image yourself, you can do so with:

```bash
docker build -t robotics .
```

then change the image name in the `docker-compose.yml` file to `robotics`.
