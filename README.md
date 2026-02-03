<<<<<<< HEAD
# xman-tools
=======
# xman-tools
# xman-tools



## Getting started

To make it easy for you to get started with GitLab, here's a list of recommended next steps.

Already a pro? Just edit this README.md and make it your own. Want to make it easy? [Use the template at the bottom](#editing-this-readme)!

## addhost.sh Usage:
```
Usage: ./addhosts.sh -c NodeConfFile -n NodeListFile

Parameters:

        -n | --nodes=NodeListFile

        -c | --conf=NodeConfFile
```
## Nodes list file example:
```
Hostname                IP              MAC
bws0991.ihep.ac.cn      192.168.57.124  D4:04:E6:B1:00:2A  
bws0992.ihep.ac.cn      192.168.57.125  D4:04:E6:B0:81:F4  
bws0993.ihep.ac.cn      192.168.57.126  D4:04:E6:B0:98:AA  
bws0994.ihep.ac.cn      192.168.57.127  D4:04:E6:B0:E1:3A  
bws0995.ihep.ac.cn      192.168.57.128  D4:04:E6:B0:A0:0C  
```
## Config file example:
```
DOMAIN_ID=1
ENV_ID=6
SUBNET_ID=11   # 57
ARCH_ID=1
PROXY_ID=1
MEDIUM_ID=29  # almalix
HOSTGROUP_ID=250  # 2023BASE/BWS
PTABLE_ID=214
PXE_LOAD="Grub2 UEFI"
#PXE_LOAD="PXELinux BIOS"
#OS_ID=45 #7.8.2003
#OS_ID=48 #7.9.2009
OS_ID=57 #alma94
## Hwo to get these is id:
hammer subnet list
hammer os list
hammer **** list
