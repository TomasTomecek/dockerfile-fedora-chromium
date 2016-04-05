# dockerfile-fedora-chromium

## Building it

```bash
docker build --tag=fedora-chromium .
```

## Running it

```
docker run \
    --net host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -e XAUTHORITY=/.Xauthority \
    -v ~/.Xauthority:/.Xauthority:ro \
    --name chromium \
    fedora-chromium
```

### Required
 * `--net host` — use host's network stack, otherwise you'll see:
```
[1:1:0327/114315:ERROR:browser_main_loop.cc(210)] Gtk: cannot open display: :0.0
```
 * `-v /tmp/.X11-unix:/tmp/.X11-unix` — bindmount X socket
 * `-e DISPLAY=$DISPLAY` — connect to proper display
 * `-e XAUTHORITY=/.Xauthority -v ~/.Xauthority:/.Xauthority:ro` — X auth stuff
 * `-v ~/.Xauthority:/.Xauthority:ro` — again, X auth stuff

### Optional
 * `--cpuset-cpus 0` — one core is just enough
 * `--memory 512mb` — that should be enough
 * `-v $HOME/Downloads:/home/chromium/Downloads` — get access to `Downloads` dir in your profile
 * `-v $HOME/.config/chromium/:/home/chromium/.config/chromium\` — preserve runtime configuration
 * `-v /dev/snd:/dev/snd --privileged` — sound


![Chromium in container, yay!](https://github.com/TomasTomecek/dockerfile-fedora-chromium/blob/master/chromium-in-container.png)


This is heavily inspired by [Jessie Frazelle's blog post](https://blog.jessfraz.com/posts/docker-containers-on-the-desktop.html).
