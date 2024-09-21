resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

#resource "aws_key_pair" "my_key" {
 # key_name   = "my-key"  # Name for the key pair
  #public_key = tls_private_key.my_key.public_key_openssh  # Use the generated public key
#}

output "private_key" {
  value     = tls_private_key.my_key.private_key_pem
  sensitive = true
}
