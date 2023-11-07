data "aws_ami" "amazon-linux-2" {
  most_recent = true
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_network_interface" "interface" {
    subnet_id = "subnet-03e6289b7b37451da" #used one of my default subnets
    security_groups = [aws_security_group.allow_tls.id]
}

resource "aws_instance" "ec2-jenkins" {
    depends_on = [aws_network_interface.interface]
    ami = data.aws_ami.amazon-linux-2.id
    instance_type = "t2.medium"
    user_data = <<EOF
    
    #!/binb/bash

    #Installing Jenkins

    yum update -y
    wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
    rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
    yum upgrade
    dnf install java-17-amazon-corretto -y
    yum install jenkins -y

    EOF
}