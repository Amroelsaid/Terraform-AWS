variable "subnet_map"{
    type = map(object({
cidr_block = string
az = string
is_public = bool

    }))
}

variable "vpc_id" {
    type = string
}