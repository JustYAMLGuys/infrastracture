output "key_pair_id" {
  description = "The key pair ID."
  value       = aws_key_pair.key_pair.key_pair_id
}

output "key_pair_name" {
  description = "The key pair name."
  value       = aws_key_pair.key_pair.key_name
}

output "key_pair_arn" {
  description = "The key pair ARN."
  value       = aws_key_pair.key_pair.arn
}

output "key_type" {
  description = "The type of key pair."
  value       = aws_key_pair.key_pair.key_type
}

output "fingerprint" {
  description = "The MD5 public key fingerprint."
  value       = aws_key_pair.key_pair.fingerprint
}

output "tags_all" {
  description = "A map of tags assigned to the resource."
  value       = aws_key_pair.key_pair.tags_all
}
