data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name = "DevOps-test"
  
  connection {
    type     = "ssh"
    user     = "ubuntu"
    host     = self.public_ip
  }
  
  tags = {
    Name = "HelloWorld"
  }
 
  provisioner "local-exec" {
      command = "ansible-playbook -i devops.ini playbook_prj1.yml -e \"ec2host=${self.public_ip} ansible_host=${self.public_ip}\""
  }
}
