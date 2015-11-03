#!/bin/bash

#variables
nbrdrvs=
img=cloud5-admin.x86_64-0.2.1-Build16.95.install.iso 
#driveltrs=(`cat /proc/partitions | grep 3993600 | awk '{ print $4 }'`)
# match usb dives that are attached.
driveltrs=(`ls -l1 /dev/disk/by-path | grep usb | awk '{ print $11 }' | cut -c 7- | grep "^sd.$"`)

echo ${driveltrs[@]}

outputlist=''
for dev in ${driveltrs[@]} ; do
  outputlist+="/dev/$dev "
done
echo $outputlist
pv $img | tee $outputlist > /dev/null
sync

