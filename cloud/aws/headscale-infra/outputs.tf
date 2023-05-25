output "ami_id" {
  description = "value of data.aws_ami.latest.id for each instance"
  value       = { for k, v in module.instances : k => v.ami_id }
}
