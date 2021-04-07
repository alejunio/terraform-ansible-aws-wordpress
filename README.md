![alt text](https://raw.githubusercontent.com/alejunio/terraform-ansible-aws-wordpress/main/img/stack-wordpress-aws-terraform-ansible.jpg)
# 🚀  Stack Terraform AWS - Servidor Hospedagem WordPress

Automatize o deploy e instalação de servidores EC2 na Amazon AWS para hospedagem de sites em WordPress. 


## Objetivo da Stack

Criar um servidor com o site WordPress na AWS de forma automatizada.

# Soluções na Stack

A Stack foi projetada com as seguintes soluções/ferramentas.

* Automação: Terraform, Ansible, ShellScript
* Softwares Server: PHP, MySQL, Nginx, SSL Let's Encrypt 


## Requisitos

* Conta válida na AWS
* Domínio configurado no Route53
* Terraform instalado na máquina local 


## Deploy da Stack 

#### 1) Clone o repositório através do terminal
```shell
git clone https://github.com/alejunio/terraform-ansible-aws-wordpress.git
```
Após clonar o repositório, abra o diretório do projeto.

#### 2) Configurando Variáveis Terraform
Para quem não conhece o Terraform, usamos um arquivo para definir todas as variáveis. Isso é muito útil quando estamos configurando servidores e até mesmo registros de DNS.

Inclusive, nessa Stack eu assumo que você tenha configurado previamente seu domínio no Route53 que é o serviço de DNS na AWS. Pois é certo de que você vá adicionar registros de e-mail, ftp, e outros serviços que não tem relação com a nossa Stack.

O arquivo ariable.tf , é o arquivo que iremos editar.

```shell
# Tokens Access AWS
variable "access-key" {
  description = "access key"
  default     = "access-aqui"
}
variable "secret-key" {
  description = "secret key"
  default     = "secret-aqui"
}

# Zone DNS AWS
variable "zone_dns" {
  default     = "digite-aqui"
}

# Dominio DNS
variable "dns_domain" {
  default     = "exemplo.com"
}
```

#### 3) Configurando Variáveis Ansible
O Ansible também possui seu arquivo de variáveis, e é preciso ajusta-lo também.

O caminho para o arquivo é: ansible/vars/vars.yml
```shell
# Var - MySQL
db_user: user
db_user_password: 654321
db_name: db-default
mysql_root_password: senharoot

# Var - Nginx e Site
dominio_site: exemplo.com.br
diretorio_site: /var/www/{{ dominio_site }}/public_html
email: exemplo@email.com

# Var - SSL
diretorio_ssl: /etc/letsencrypt/{{ dominio_site }}
```
Edite todas as variáveis do MySQL, domínio do seu site e email.

#### 4) Chaves SSH

Para a configuração das chaves SSH recomendo a leitura abaixo:
https://alejunio.cloud/devops/stack-wordpress-aws-terraform-ansible/#Gerando_Chaves_SSH

#### 5) Deploy  : Criando o Servidor WordPress

Para dar início ao deploy, execute os comandos abaixo no terminal.

```shell
terraform init
```
```shell
terraform apply -auto-approve
```

#### 6) Deploy  : Deletando o Servidor WordPress

Para remover o servidor, basta executar o comando abaixo.

```shell
terraform destroy -auto-approve
```

