#!/bin/bash
set -e

mkdir -p /run/sshd
ssh-keygen -A

if [ -f /tmp/authorized_keys ]; then
    mkdir -p /home/ansible/.ssh
    cp /tmp/authorized_keys /home/ansible/.ssh/authorized_keys
    chown -R ansible:ansible /home/ansible/.ssh
    chmod 700 /home/ansible/.ssh
    chmod 600 /home/ansible/.ssh/authorized_keys
fi

(
    while true; do
        if command -v nginx >/dev/null 2>&1 && [ -f /etc/nginx/nginx.conf ]; then
            if ! pgrep -x nginx >/dev/null 2>&1; then
                if nginx -t >/dev/null 2>&1; then
                    nginx
                fi
            fi
            break
        fi
        sleep 2
    done
) &

exec /usr/sbin/sshd -D -e
