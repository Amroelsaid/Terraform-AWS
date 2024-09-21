output "nginx_instance_ids" {
  value = aws_instance.nginx.*.id
}
