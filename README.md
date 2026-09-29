# DevOps Intern Assessment

## Overview

This project implements the DevOps Intern Assessment environment using Docker, Docker Compose, Ansible, OpenSSH, Nginx, OpenSSL, iptables, Git and Ansible Vault.

The environment contains three Ubuntu containers:

- vm1 - Nginx reverse proxy and HTTPS endpoint
- vm2 - Backend web server
- vm3 - Backend web server

## Architecture

The containers communicate through a custom Docker bridge network named `devops_net`.

Network configuration:

- Network: `devops_net`
- Subnet: `172.20.0.0/24`
- vm1: `172.20.0.10`
- vm2: `172.20.0.20`
- vm3: `172.20.0.30`

vm1 acts as the Nginx reverse proxy and HTTPS endpoint. vm2 and vm3 provide the backend web services.

## Docker

Docker Compose creates three Ubuntu containers with static IP addresses, automatic restart policies, SSH access, Nginx and the required administration utilities.

The containers can be checked using:

```bash
docker ps
