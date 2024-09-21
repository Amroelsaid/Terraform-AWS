resource "aws_instance" "nginx" {
    count = 2
    ami =var.ami_id
    instance_type = var.instance_type
    subnet_id = element(var.private_subnet_ids,count.index)
    vpc_security_group_ids = [var.ec2_sg_id]

    user_data= <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install ngnix -y
                sudo systemctl start ngnix
                sudo systemctl enable ngnix
                EOF
    tags =  {
        Name= "nginx-server-${count.index}"
    }
}

resource "aws_instance" "bastion" {
    ami=var.ami_id
    instance_type = var.instance_type
    subnet_id = var.public_subnet_id
    key_name = "my-key" 
    #key_name = aws_key_pair.my_key.key_name
    vpc_security_group_ids = [var.bastion_sg_id]

    tags={
        Name ="bastion-host"
    }
}