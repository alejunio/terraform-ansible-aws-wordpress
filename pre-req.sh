#!/bin/bash 
#
# pre-req.sh - Pre configuração de servidor com Ansible
#
# Site       : https://alejunio.cloud
# Autor      : Alex Junio <contato@alejunio.cloud>
# 
# ---------------------------------------------------------
# Esse script vai instalar tudo o que a stack precisa para
# executar o ansible e as tasks corretamente. 
# ---------------------------------------------------------
# 
# Histórico:
#
#   v1.0 17/03/2021, Alex Junio.
#      - Versão inicial do Script
#


# Install Ansible
sudo apt update 
sudo apt-get install python3 git unzip htop -y
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y 

# Configuracao Host Ansible
cd /etc/ansible/ && sudo rm hosts && sudo wget https://raw.githubusercontent.com/alejunio/ansible-wordpress/main/ansible/hosts

# Instalacao Certbot SSL
sudo snap install core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot






