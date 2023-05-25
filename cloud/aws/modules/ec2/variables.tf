## AMI variables ##
variable "default_ami" {
  description = "Defines options for AMI selection"
  type        = map(any)
  default     = {
    "amazon-linux" = {
        name = "amzn2-ami-hvm-*"
        ami_id = "*"
    },
    "custom"       = {
        name = ""
        ami_id = ""
    },
    "windows-2019" = {
        name = "Windows_Server-2019-English-Full-Base-*"
        ami_id = "*"
    },
    "windows-2022" = {
        name = "Windows_Server-2022-English-Full-Base-*"
        ami_id = "*"
    },
    "windows-2019-sql" = {
        name = "Windows_Server-2019-English-Full-SQL_2019_Standard-*"
        ami_id = "*"
    },
    "windows-2022-sql" = {
        name = "Windows_Server-2022-English-Full-SQL_2019_Standard-*"
        ami_id = "*"
    }
  }
}
variable "custom_ami" {
  description = "Custom AMI to use if var.ami is set to custom"
  type        = string
  default     = ""
}
variable "ami" {
  description = "Enter a string that matches one of the default values of var.default_ami. If custom, specify the AMI name in var.custom_ami"
  type        = string
  default     = "amazon-linux"
}

## EC2 instance variables ##
variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "my-ec2-instance"
}
variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}
variable "subnet_id" {
  description = "Subnet ID to launch the EC2 instance in"
  type        = string
  default     = ""
}
variable "public_instance" {
    description = "Whether to launch the EC2 instance with a public IP address"
    type        = bool
    default     = false
}
variable "tags" {
    description = "A map of tags to apply to all resources"
    type        = map
    default     = {
        "Terraform" = "true"
        "Environment" = "dev"
    }
}
variable "keypair_name" {
    description = "Name of the keypair to use for the EC2 instance"
    type        = string
    default     = ""
}
variable "security_group_ids" {
    description = "List of security group IDs to apply to the EC2 instance"
    type        = list(string)
    default     = []
}
variable "ec2_iam_role" {
    description = "IAM role to apply to the EC2 instance"
    type        = string
    default     = ""
}
variable "root_volume_size" {
    description = "Size of the root volume in GB"
    type        = number
    default     = 8
}
variable "root_volume_type" {
    description = "Type of the root volume"
    type        = string
    default     = "gp3"
}
variable "secondary_volume_size" {
    description = "Size of the secondary volume in GB"
    type        = number
    default     = 0
}
variable "secondary_volume_type" {
    description = "Type of the secondary volume"
    type        = string
    default     = "gp3"
}
variable "secondary_volume_mount_point" {
    description = "Mount point of the secondary volume"
    type        = string
    default     = "/dev/sdb"
}
variable "use_eip" {
    description = "Whether to use an Elastic IP address"
    type        = bool
    default     = false
}