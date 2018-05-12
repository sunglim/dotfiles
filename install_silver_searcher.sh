#!/bin/bash

if grep -q "Ubuntu" /var/log/installer/media-info
then
    apt-get install silversearcher-ag
else
    echo 'silversearcher is not installed'
fi
