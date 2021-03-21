#####################################################################
# Create a web server
#####################################################################

// Criando EC2
resource "aws_instance" "web" {
  ami           = "ami-013f17f36f8b1fefb"
  instance_type = "t2.micro"
  root_block_device {
        volume_type = "gp2"
        volume_size = 20
        encrypted   = true
    }
  key_name = aws_key_pair.acesso.id
  vpc_security_group_ids = [aws_security_group.security.id]
  subnet_id = aws_subnet.pub_01.id
  tags = {
    Name = "Web"
  }
}










