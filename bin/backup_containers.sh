#!/bin/sh

mkdir -p ~/backups/distrobox-backups

function gen_environments()
{
    distrobox list | awk -F'|' 'NR>1 {gsub(/^[ \t]+|[ \t]+$/, "", $2); print $2}'
}


for container in $(gen_environments); do
    echo "Backing up $container"

    podman container commit -p $container $container
    podman  save $container:latest | bzip2 > ~/backups/distrobox-backups/"$container".tar.bz
done

