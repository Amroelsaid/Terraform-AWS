output "alb_sg_id" {
  value = aws_security_group.alb-sg.id
}

output "ec2_sg_id" {
  value = aws_security_group.ec2-sg.id
}

output "bastion_sg_id" {
  value = aws_security_group.bastion-sg.id
}