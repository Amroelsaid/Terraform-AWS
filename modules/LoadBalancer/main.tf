resource "aws_lb" "this"{
    name="nginx-load-balancer"
    internal = false
    load_balancer_type = "application"
    security_groups = [var.alb_sg_id]
    subnets = var.public_subnet_ids
}

resource "aws_lb_target_group" "this" {

    name=  "nginx-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group_attachment" "nginx" {
    count = 2
    target_group_arn = aws_lb_target_group.this.arn
    target_id  =var.ec2_instance_ids[count.index]
    port = 80
}