variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type = string
}

variable "subnet_count" {
  description = "The number of subnets"
  type = number
}

variable "newbits" {
  description = "The new bits for the subnet size"
  type = number
}

variable "cidr_route" {
  description = "The CIDR block for the route"
  type = string
}

variable "common_tags" {
  description = "The common tags"
  type = map(string)
}

variable "zone_name" {
  description = "The name of the private zone"
  type = string
}

variable "zone_comment" {
  description = "The comment for the private zone"
  type = string
}

variable "create_zone" {
  description = "Whether to create the Route53 zone"
  type = bool
  default = false
}

variable "single_nat_gateway" {
  description = "If true, a single NAT gateway will be created. If false, a NAT gateway will be created for each subnet."
  type = bool
}

variable "create_private_subnets" {
  description = "Whether to create private subnets"
  type = bool
  default = true
}