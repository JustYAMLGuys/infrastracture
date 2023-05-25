output "ami_id" {
  description = "AMI ID"
  value       = data.aws_ami.latest.id
}