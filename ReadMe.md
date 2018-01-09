# WHIPS Docker Image

This is a WHIPS docker image to simplify the issue of managing dependencies. Requires docker to be
installed on the machine. See the [Docker documentation](https://docs.docker.com/engine/installation/).

To pull the image from the internet:

```bash
docker pull ericmiller/whips:0.1
```

To make a shorthand for easy use:

```bash
docker tag ericmiller/whips whips
```

To run the image:

```bash
docker run --rm -it whips
root@25131c57ad76:/#
```

From here you should be able to use `whips` as needed.

If you want to map volumes from your host machine to the docker image (to make saving input and
output easier), you can use a command like `-v /home/user/Documents:/usr/home/Documents`

If there is something broken, or something you want added, feel free to fork this repository or
read [Contributing.md](Contributing.md).
