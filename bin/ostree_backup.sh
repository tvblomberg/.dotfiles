#!/bin/sh

mkdir -p ~/backups

ostree log fedora:fedora/40/x86_64/sericea > ~/backups/ostree.log
rpm-ostree status > ~/backups/rpm-ostree-status.lst
