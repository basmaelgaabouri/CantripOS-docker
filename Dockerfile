FROM ubuntu:22.04

ENV PLATFORM=rpi3 

RUN apt-get update && \
	apt-get install -yqq --no-install-recommends apt-transport-https gnupg\
    ca-certificates \
    ssh \
    asciidoctor \
    bison \
    build-essential \
    ccache \
    clang \
    clang-format \
    cmake \
    cmake-curses-gui \
    cpio \
    curl \
    device-tree-compiler \
    doxygen \
    flex \
    fzf \
    gdb \
    git \
    gtk-sharp2 \
    graphviz \
    haskell-stack \
    lcov \
    libcanberra-gtk-module \
    libclang-dev \
    libcunit1-dev \
    libc6-dev \
    libtool \
    llvm-13-tools \
    gcc \
    g++ \
    gcc-11 \
    g++-11 \
    libftdi1 \
    libftdi1-dev \
    libfl2 \
    libfl-dev \
    libglib2.0-dev \
    libglib2.0-dev-bin \
    libgtk2.0-0 \
    libpixman-1-dev \
    libpython3-dev \
    libpython3.10 \
    libsqlite3-dev \
    libssl-dev \
    libtinfo-dev \
    libtinfo5 \
    libwww-perl \
    libxml2-dev \
    libxml2-utils \
    libxslt-dev \
    libzmq5 \
    lrzsz \
    mono-complete \
    ncurses-dev \
    ninja-build \
    perl \
    protobuf-compiler \
    pv \
    python-is-python3 \
    python3-protobuf \
    python3 \
    python3.10 \
    python3-dev \
    python3.10-dev \
    python3-pip \
    rsync \
    srecord \
    texinfo \
    texlive-bibtex-extra \
    texlive-fonts-recommended \
    texlive-latex-extra \
    texlive-metapost \
    u-boot-tools \
    uml-utilities \
    policykit-1 \
    screen \
    wget \
    xxd \
    zlib1g \
    zlib1g-dev \
    bazel \
    bazel-5.1.1

RUN mkdir -p ~/.bin && \
    PATH="${HOME}/.bin:${PATH}" && \
    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo && \
    chmod a+rx ~/.bin/repo && \
    mkdir sparrow && \
    cd sparrow && \
    repo init -u https://github.com/AmbiML/sparrow-manifest -m sparrow-manifest.xml && \
    repo sync -j$(nproc) && \
    source build/setup.sh && \
    m simulate-debug

  