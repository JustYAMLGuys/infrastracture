cidr_block = "10.199.0.0/16"
subnet_count = 3
newbits = 8 # If VPC CIDR is /16, then newbits should be 8 for /24 subnets. If VPC CIDR is /20, then newbits should be 4 for /24 subnets. Etc
cidr_route = "0.0.0.0/0"

single_nat_gateway = true
create_private_subnets = false

common_tags = {
  "Name" = "latency-testing"
  "Environment" = "Test"
  "Owner" = "Nick Bissel"
  "Terraform Managed" = "true"
}

create_zone = false
zone_name = ""
zone_comment = "Private zone for new vpc"
