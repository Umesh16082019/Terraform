#!/bin/bash

# Enable password authentication and set the password
echo "ec2-user:DevOps321" | sudo chpasswd
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Install Ansible
dnf install ansible -y