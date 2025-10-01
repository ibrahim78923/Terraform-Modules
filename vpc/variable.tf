variable "vpc_cidr" {
  type = string
}

variable "instance_tenancy" {
  type = string
}

variable "vpc_name" {
  type = string
  
}

################################

variable "public_subnet_count" {
  type        = number
  description = "Number of public subnets to create"
}

variable "private_subnet_count" {
  type        = number
  description = "Number of private subnets to create"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones"
}
