#!/bin/bash

# Define PATH for cron
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# --- Data Gathering ---
arch=$(uname -a)
cpup=$(grep "physical id" /proc/cpuinfo | sort | uniq | wc -l)
cpuv=$(grep "^processor" /proc/cpuinfo | wc -l)
ram_total=$(free -m | awk '$1 == "Mem:" {print $2}')
ram_use=$(free -m | awk '$1 == "Mem:" {print $3}')
ram_pct=$(free | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')
disk_total=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{use += $2} END {printf ("%.1fGb"), use/1024>
disk_use=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{use += $3} END {print use}')
disk_pct=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{use += $3; total += $2} END {printf("%d"), us>
cpul=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
lb=$(who -b | awk '{print $3 " " $4}')
lvmu=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)
tcpc=$(ss -ta | grep ESTAB | wc -l)
ulog=$(users | wc -w)
ip=$(hostname -I | awk '{print $1}')
mac=$(ip link | grep "link/ether" | awk '{print $2}')

# FIXED SUDO LINE: Added -a to handle "binary file" error and pointed to your config
cmds=$(grep -a COMMAND /var/log/sudo_config | wc -l)

# --- The Message ---
msg="   #Architecture: $arch
        #CPU physical : $cpup
        #vCPU : $cpuv
        #Memory Usage: $ram_use/${ram_total}MB ($ram_pct%)
        #Disk Usage: $disk_use/$disk_total ($disk_pct%)
        #CPU load: $cpul%
        #Last boot: $lb
        #LVM use: $lvmu
        #Connections TCP : $tcpc ESTABLISHED
        #User log: $ulog
        #Network: IP $ip ($mac)
        #Sudo : $cmds cmd"

# --- The Broadcast ---
echo -e "$msg" | w
