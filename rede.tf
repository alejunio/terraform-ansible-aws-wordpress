#####################################################################
# CONFIGURACAO VPC
#####################################################################



// VPC
resource "aws_vpc" "projeto-a" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "projeto-a"
  }
}

// Subnet
resource "aws_subnet" "pub_01" {
  vpc_id     = aws_vpc.projeto-a.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Sub"
  }
}


// Internet Gatway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.projeto-a.id

  tags = {
    Name = "gatway-projeto"
  }
}

// Tabela de roteamento
resource "aws_route_table" "My_VPC_route_table" {
 vpc_id = aws_vpc.projeto-a.id
 tags = {
        Name = "My VPC Route Table"
}
}

// Criando acesso a web
resource "aws_route" "My_VPC_internet_access" {
  route_table_id         = aws_route_table.My_VPC_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
} 

// Associando a tabela de roteamento com a subnet
resource "aws_route_table_association" "My_VPC_association" {
  subnet_id      = aws_subnet.pub_01.id
  route_table_id = aws_route_table.My_VPC_route_table.id
} 


