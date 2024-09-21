variable "subnet_map"{
    type = map(object({
cidr_block = string
az = string
is_public = bool

    }))
}

variable "aws_region"{
    type = string
}