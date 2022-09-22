#!/bin/bash

ansible-playbook pve.yml --limit nvme_lab
read -p 'Has pve.yml completed successfully? (y/n) ' pve_complete

if [ $pve_complete = 'y' ]
then
  echo 'Continuing run...'
  ansible-playbook -i inventory/lab_hosts manage_nodes.yml --ask-vault-pass
  ansible-playbook -i inventory/lab_hosts prometheus.yml
  ansible-playbook -i inventory/lab_hosts grafana.yml
fi
