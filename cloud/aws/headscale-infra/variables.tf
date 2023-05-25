### Global variables ###

variable "required_tags" {
  description = "A map of tags that should be applied to all resources"
  type        = map(string)
  default     = {}
}

### Instance variables ###

variable "instances" {
  description = "List of instances to create"
  type        = list(object({
    custom_ami       = string
    ami              = string
    instance_name    = string
    #ec2_iam_role     = string
    instance_type    = string
    subnet_id        = string
    public_instance  = bool
    root_volume_size   = number
    root_volume_type   = string
    secondary_volume_size = number
    secondary_volume_type = string
    secondary_volume_mount_point = string
  }))
}
variable "ec2_tags" {
  description = "A map of tags that should be applied to all EC2 instances"
  type        = map(string)
  default     = {}
}

variable "use_eip" {
  description = "Whether to use an Elastic IP address"
  type        = bool
  default     = false
}

### Security group variables ###

variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "sg_description" {
  description = "Description of the security group"
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type        = list(object({
    description      = string
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    security_groups  = string
    self             = bool
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rules"
  type        = list(object({
    description      = string
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    security_groups  = string
    self             = bool
  }))
  default = []
}
variable "sg_tags" {
  description = "A map of tags that should be applied to the security group"
  type        = map(string)
  default     = {}
}

### Key Pair variables ###

variable "key_name" {
  description = "The name for the key pair."
  type        = string
}

variable "public_key" {
  description = "The public key material."
  type        = string
}
variable "keypair_tags" {
  description = "A map of tags that should be applied to the key pair"
  type        = map(string)
  default     = {}
}
