##############################################################################
# Configuracao do EC2
##############################################################################


resource "null_resource" "servidor-ec2" {
  triggers = {
    ip_address = aws_instance.web.public_ip
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("ssh/id_rsa")
    host     = aws_instance.web.public_ip
  }

  provisioner "file" {
    source      = "pre-req.sh"
    destination = "/tmp/pre-req.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/pre-req.sh",
      "/tmp/pre-req.sh",
    ]
  }
  
  // Pacote Ansible com Stack LAMP SSL e WordPress
  provisioner "file" {
    source      = "ansible/"
    destination = "/home/ubuntu/"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo cd /home/ubuntu/ansible",
      "sudo ansible-playbook playbook.yml",
    ]
  }

  depends_on = [
    aws_route53_record.a,
  ]
}