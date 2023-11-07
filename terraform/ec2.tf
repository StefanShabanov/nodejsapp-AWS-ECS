data "aws_ami" "aws-linux-2" {
    most_recent = true
}

resource "aws_network_interface" "interface" {
    subnet_id = "subnet-03e6289b7b37451da" #used one of my default subnets
    security_groups = ##########################################  
}

resource "aws_instance" "ec2-jenkins" {
    depends_on = [aws_network_interface.interface]
    ami = data.aws_ami.aws-linux-2.id
    instance_type = "t2.medium"  
}