#!/bin/bash

ansible-playbook -i inventory/lab_hosts manage_nodes.yml --ask-vault-pass -e '{ __rhsm_register: False }'
ansible-playbook pve.yml -e __run_action=destroy
