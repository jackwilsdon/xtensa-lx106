# xtensa-lx106-elf

Docker container for xtensa-lx106-elf compiler.

## Building

To build the container you can just run the build script:

```Bash
./build
```

> Note that building the container can take quite a while, as it has to compile everything from scratch.

The build script provides a number of options allowing you to change certain build settings:

```Bash
./build -h
```

```
usage: build [-h] [-n] [-t TAG]

Build script for xtensa-lx106-elf development container

arguments:
  -h                    show this help message and exit
  -n                    don't run docker and just print
                        the command instead
  -t TAG                the tag of the image to build

environment variables:
  NAME                  the name of the image to build
  TAG                   the tag of the image to build
  SOURCE                the source directory of the image
  DOCKER                the location of the docker binary

environment variables can be overridden by normal arguments
```

Here's an example of changing the name and tag of the build (e.g. if you were creating a custom build):

```Bash
NAME="my-xtensa-lx106-elf" TAG="custom" ./build
```

You can also use the `-t TAG` option to pass a tag (this overrides the `TAG` environment variable):

```Bash
NAME="my-xtensa-lx106-elf" ./build -t custom
```

You can change these options permanently inside `scripts/config.sh`.

## Running

To run the container you can use the run script provided:

```Bash
    ./run
```

The run script also provides some options:

```
usage: run [-h] [-n] [-d DATA_DIRECTORY] [-t TAG] ARGS...

Run script for xtensa-lx106-elf development container

arguments:
  -h                    show this help message and exit
  -n                    don't run docker and just print the
                        command instead
  -d DATA_DIRECTORY     mount point for /mnt/data inside the
                        container
  -t TAG                the tag of the image to run
  ARGS...               the command to run in the container

environment variables:
  NAME                  the name of the container to run
  TAG                   the tag of the container
  MOUNT                 the mount point for /mnt/data inside the
                        container
  DOCKER                the location of the docker binary

environment variables can be overridden by normal arguments
```

The run script is just a nice wrapper for `docker run` - you can see what it's doing by passing the `-n` flag:

```Bash
./run -n /bin/bash
```

```Bash
/usr/local/bin/docker run --rm --interactive --tty jackwilsdon/xtensa-lx106-elf:latest /bin/bash
```

You can mount any directories you want inside the container using the `-d` flag:

```Bash
ls
```

```
README.md
build
docker
run
scripts
```

```Bash
./run -d $(pwd) /bin/bash
```

```Bash
ls # inside the container
```

```
README.md
build
docker
run
scripts
```
