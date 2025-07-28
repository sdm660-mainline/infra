FROM ubuntu:24.04

# Linux build deps
RUN DEBIAN_FRONTEND=noninteractive apt update && apt -y upgrade && \
	apt install -y bc bison build-essential device-tree-compiler \
	flex git kmod libncurses-dev libssl-dev python3 \
	zstd bsdmainutils
# for checking DTBs
RUN DEBIAN_FRONTEND=noninteractive apt install -y \
	libfdt-dev python3-dev python3-libfdt python3-venv swig
# useful utils for manual work and pmbootstrap deps
RUN DEBIAN_FRONTEND=noninteractive apt install -y \
	nano htop neofetch opendoas kpartx

# add user & group for runner (GID & UID match the same user on host)
RUN groupadd --gid 1003 developers
RUN useradd -c "GitHub actions runner user" \
	--home-dir /home/runner --no-create-home \
	--groups developers --no-user-group \
	--shell /bin/bash --uid 10001 runner

# copy and extract actions-runner application
WORKDIR /opt/runner
COPY        actions-runner-linux-arm64.tar.gz /opt/runner/
RUN tar xzf actions-runner-linux-arm64.tar.gz
RUN rm -f   actions-runner-linux-arm64.tar.gz

# copy runner config and OAuth tokens
COPY .credentials           /opt/runner/
COPY .credentials_rsaparams /opt/runner/
COPY .runner                /opt/runner/

# fix permissions
RUN chown -R runner:developers  /opt/runner/*
RUN chown -R runner:developers  /opt/runner/.*

# setup doas to run pmbootstrap and do various mounts and losetup...
RUN echo 'permit nopass keepenv :developers' > /etc/doas.conf

# set hostname
RUN echo arm64builder > /etc/hostname

# clone pmbootstrap
WORKDIR /opt
RUN git clone https://gitlab.postmarketos.org/postmarketOS/pmbootstrap.git
RUN ln -sf /opt/pmbootstrap/pmbootstrap.py /usr/local/bin/pmbootstrap
RUN chown -R runner:developers  /opt/pmbootstrap
RUN chmod -R g+w /opt/pmbootstrap

VOLUME [ "/home/runner" ]

USER runner:developers
WORKDIR /opt/runner
CMD [ "/opt/runner/run.sh" ]
