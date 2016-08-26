FROM phusion/baseimage:latest

MAINTAINER Jack Wilsdon <jack.wilsdon@gmail.com>

# Speed up install
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/docker && \
    echo "DPkg::Post-Invoke { \
             \"/bin/rm -f /var/cache/apt/archives/*.deb || true\"; \
         }; \
         Acquire::Languages \"none\"; \
         Acquire::GzipIndexes \"true\"; \
         Acquire::CompressionTypes::Order:: \"gz\"; \
         " > /etc/apt/apt.conf.d/docker

# Install dependencies
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
    autoconf \
    bison \
    build-essential \
    flex \
    gawk \
    git \
    gperf \
    help2man \
    libexpat-dev \
    libncurses5-dev \
    libtool-bin \
    texinfo \
    wget

# Install crosstool-NG
RUN useradd -mU -d /mnt/data build && \
    git clone --branch xtensa-1.22.x --depth 1 \
        https://github.com/jcmvbkbc/crosstool-NG.git /tmp/crosstool-NG && \
    cd /tmp/crosstool-NG && \
    ./bootstrap && \
    ./configure --prefix=/usr/local && \
    make && \
    make install && \
    cp -Rf local-patches overlays \
        "/usr/local/lib/$(git rev-parse --short HEAD)" && \
    cd / && \
    rm -rf /tmp/crosstool-NG

# Build and install xtensa-lx106-elf compiler
RUN su build -c " \
        export PATH=\"/opt/crosstool-NG/bin:$PATH\" && \
        mkdir -p /tmp/xtensa-lx106-elf-build && \
        cd /tmp/xtensa-lx106-elf-build && \
        ct-ng xtensa-lx106-elf && \
        sed -i'' 's/^CT_DEBUG_gdb=y$/CT_GDB_CROSS=n/g' .config && \
        sed -i'' \
            's/^CT_PREFIX_DIR=.*$/CT_PREFIX_DIR=\"\/tmp\/xtensa-lx106-elf\"/g' \
            .config && \
        ct-ng build \
    " && \
    cd / && \
    rm -rf /tmp/xtensa-lx106-elf-build && \
    rm /tmp/xtensa-lx106-elf/build.log.bz2 && \
    cp -Rf /tmp/xtensa-lx106-elf/* /usr/local && \
    rm -rf /tmp/xtensa-lx106-elf

# Add root directory
ADD root /

# Set up mount point for data
VOLUME /mnt/data

# Set entrypoint to run commands as build user
ENTRYPOINT ["/sbin/my_init", "--quiet", "--", "/sbin/runas", "build"]
