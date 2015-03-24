# dockerfile-fedora-chromium

## Building it

```bash
docker build --tag=fedora-chromium .
```

## Running it

```
docker run \
    --net host \
    --cpuset 0 \
    --memory 512mb \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    --name chromium \
    -e XAUTHORITY=/.Xauthority \
    -v ~/.Xauthority:/.Xauthority:ro \
    --privileged \
    fedora-chromium
```


 * `--net host` — use host's network stack
 * `--cpuset 0` — one core is just enough
 * `--memory 512mb` — that should be enough
 * `-v /tmp/.X11-unix:/tmp/.X11-unix` — bindmount X socket
 * `-e DISPLAY=$DISPLAY` — connect to proper display
 * `-e XAUTHORITY=/.Xauthority -v ~/.Xauthority:/.Xauthority:ro` — X auth stuff
 * `--privileged` — get access to /dev

