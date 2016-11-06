#!/bin/bash
if [[ -z $(grep dockerhost /etc/hosts) ]]
then
    echo `/sbin/ip route|awk '/default/ { print $3 }'` dockerhost >> /etc/hosts
fi

rm -rf /ssh
cp -R /root/.ssh /ssh
chmod -R 600 /ssh
/usr/bin/autossh ${SSH_STRING} -N -i /ssh/id_rsa
