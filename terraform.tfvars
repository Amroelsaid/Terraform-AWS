aws_region = "us-east-1"

subnet_map = {
  "public1" = {
    cidr_block = "10.0.1.0/24"
    az         = "us-east-1a"
    is_public  = true
  }
  "public2" = {
    cidr_block = "10.0.2.0/24"
    az         = "us-east-1b"
    is_public  = true
  }
  "private1" = {
    cidr_block = "10.0.3.0/24"
    az         = "us-east-1a"
    is_public  = false
  }
  "private2" = {
    cidr_block = "10.0.4.0/24"
    az         = "us-east-1b"
    is_public  = false
  }
}