*This project has been created as part of the 42 curriculum by
sjumaniy.*

# Born2BeRoot

## Description

**Born2BeRoot** is a system administration project from the 42
curriculum.The goal of this project is to discover the fundamentals of
Linux system administration by setting up and securing a virtual machine
from scratch.

The project focuses on:

-   Installing and configuring a Linux operating system

-   Applying strict security rules

-   Managing users and groups

-   Configuring services such as SSH, sudo, firewall, and monitoring

-   Understanding how a server behaves and is secured in real-world
    conditions

All configurations are done manually to ensure a deep understanding of
the system.

## Instructions

### Virtual Machine Setup

-   Hypervisor: **VirtualBox**

-   Operating System: **Debian (stable)**

-   Network: NAT with port forwarding

-   SSH access on port **4242**

### Installation & Configuration

1.  Install Debian with minimal packages (no GUI)

2.  Configure disk partitions using LVM

3.  Set hostname and users

4.  Configure:

    -   SSH

    -   sudo policies

    -   password policy (PAM + pwquality)

    -   firewall (UFW)

5.  Install and configure:

    -   Lighttpd

    -   MariaDB

    -   PHP

    -   WordPress

    -   Netdata (monitoring service)

6.  Create and schedule monitoring.sh using cron

7.  Harden the system according to project rules

### Execution

-   bashssh sjumaniy@10.13.200.85 -p 4242

-   **Bad Password Message:** "Bad Password"

-   **WordPress Site:** [http://10.13.200.85](http://10.13.200.85/)

-   **Monitoring
    Dashboard:** [http://10.13.200.85:19999](http://10.13.200.85:19999/)

## Resources

### Documentation & Tutorials

-   Debian Installation Guide

-   Linux man pages

-   AppArmor Documentation

-   UFW Manual

-   WordPress Codex



## System Information
### Debian vs Rocky Linux

| Debian | Rocky Linux |
|------|------------|
| AppArmor | SELinux |
| APT package manager | DNF |
| Easier to configure | More complex |
| Community-driven | Enterprise-oriented |
---


### Key Configurations

-   **Partitioning:** LVM with encrypted volume

-   **Security:** AppArmor, UFW, password policies

-   **Services:** SSH (port 4242), Lighttpd, MariaDB

-   **Monitoring:** Custom script via cron + Netdata

-   **Bonus:** WordPress website with admin panel

## Evaluation Commands
```
uname -a
lsblk
ip a
who
uptime
ss -tun
```
```
sudo adduser new_user
sudo adduser new_user sudo
sudo adduser new_user user42
```
