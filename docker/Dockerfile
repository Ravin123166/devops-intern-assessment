FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    python3 \
    python3-apt \
    curl \
    git \
    openssl \
    iptables \
    iproute2 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/sshd

RUN useradd -m -s /bin/bash ansible && \
    usermod -aG sudo ansible && \
    echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible && \
    chmod 440 /etc/sudoers.d/ansible

EXPOSE 22 80 443

COPY authorized_keys /tmp/authorized_keys
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

COPY sshd_config_assessment.conf /etc/ssh/sshd_config.d/99-assessment.conf
