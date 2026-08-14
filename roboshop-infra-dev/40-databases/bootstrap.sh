#!/bin/bash

# 1. Set the password to DevOps321
echo "ec2-user:DevOps321" | sudo chpasswd

# 2. Enable password authentication in SSH config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# 3. Restart the SSH service to apply changes
sudo systemctl restart sshd

# 4. Install Ansible
dnf install ansible -y