FROM ubuntu:24.04

RUN DEBIAN_FRONTEND=noninteractive apt update
RUN DEBIAN_FRONTEND=noninteractive apt -y upgrade
# Linux build deps
RUN DEBIAN_FRONTEND=noninteractive apt install -y bc bison build-essential device-tree-compiler flex git kmod libncurses-dev libssl-dev python3
# useful utils for manual work and pmbootstrap deps
RUN DEBIAN_FRONTEND=noninteractive apt install -y nano htop neofetch opendoas

# add user & group for runner (GID & UID match the same user on host)
RUN groupadd --gid 1003 developers
RUN useradd -c "GitHub actions runner user" --home-dir /home/runner --groups developers --create-home --no-user-group --shell /bin/bash --uid 10001 runner
COPY .bashrc /home/runner/

# copy and extract actions-runner application
COPY actions-runner-linux-arm64.tar.gz /opt/runner/
WORKDIR /opt/runner
RUN tar xzf actions-runner-linux-arm64.tar.gz
RUN rm -f /opt/runner/actions-runner-linux-arm64.tar.gz
# copy runner config and OAuth tokens
COPY .credentials           /opt/runner/
COPY .credentials_rsaparams /opt/runner/
COPY .runner                /opt/runner/
# fix permissions
RUN chown -R runner:developers  /opt/runner/*
RUN chown -R runner:developers  /opt/runner/.*
# to run pmbootstrap and do various mounts and losetup...
RUN echo 'permit nopass keepenv :developers' > /etc/doas.conf

# clone pmbootstrap
WORKDIR /opt
RUN git clone https://gitlab.com/postmarketOS/pmbootstrap.git
RUN ln -sf /opt/pmbootstrap/pmbootstrap.py /usr/local/bin/pmbootstrap
RUN chown -R runner:developers  /opt/pmbootstrap
RUN chmod -R g+w /opt/pmbootstrap

VOLUME [ "/home/runner" ]

USER runner:developers
WORKDIR /opt/runner
CMD [ "/opt/runner/run.sh" ]
