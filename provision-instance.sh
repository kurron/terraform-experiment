#!/bin/bash

echo aws-instance ansible_ssh_host=$1 > /tmp/hosts.ini 
ansible-playbook --verbose --inventory /tmp/hosts.ini playbook.yml

