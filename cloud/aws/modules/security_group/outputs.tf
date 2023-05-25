output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.this.id
}

output "security_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.this.name
}

output "security_group_description" {
  description = "The description of the security group"
  value       = aws_security_group.this.description
}

output "security_group_vpc_id" {
  description = "The VPC ID the security group is attached to"
  value       = aws_security_group.this.vpc_id
}

output "security_group_ingress_rules" {
  description = "The ingress rules of the security group"
  value       = aws_security_group.this.ingress
}

output "security_group_egress_rules" {
  description = "The egress rules of the security group"
  value       = aws_security_group.this.egress
}
