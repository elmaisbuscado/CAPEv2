#!/bin/bash
#ex: armel_2 u64 u32 mips_3 mipsel ppc_2 sparc_2
vms=(your_vm_list_goes_here)
for vm in "${vms[@]}"
do
    :
    /usr/bin/tunctl -u cape -t tap_$vm
    sudo ip link set tap_$vm master br0
    sudo ip link set dev tap_$vm up
    sudo ip link set dev br0 up
done
