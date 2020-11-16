Fluentd Docker Image
====================
## What is Fluentd?

Fluentd is an open source data collector, which lets you unify the data
collection and consumption for a better use and understanding of data.

> [www.fluentd.org](https://www.fluentd.org/)

![Fluentd Logo](https://www.fluentd.org/assets/img/miscellany/fluentd-logo.png)

## Supported tags and respective `Dockerfile` links

#### `1.10`

Version 1.10 built on alpine.


To create endpoint that collects logs on your host just run: <br />
**Note that you will need to use docker volumes on ZCX as bind mounts to the filesystem are not permitted**

```bash
docker volume create <your_vol>
docker run -d -p 24224:24224 -p 24224:24224/udp -v <your_vol>:/fluentd/log quay.io/ibmz/fluentd:1.10
```

Default configurations are to:

- listen port `24224` for Fluentd forward protocol
- store logs with tag `docker.**` into `/fluentd/log/docker.*.log`.
- store all other logs into `/fluentd/log/data.*.log`.

## Providing your own configuration file and additional options

`fluentd` arguments can be appended to the `docker run` line

For example, to provide a bespoke config and make `fluentd` verbose, then:

`docker run -ti --rm -v <your_vol>:/fluentd/etc quay.io/ibmz/fluentd:1.10 -c /fluentd/etc/<conf> -v`

The first `-v` tells Docker to share your docker volume and mount it at /fluentd/etc
The `-c` after the container name (fluentd) tells `fluentd` where to find the config file
The second `-v` is passed to `fluentd` to tell it to be verbose


#LICENSE HERE
