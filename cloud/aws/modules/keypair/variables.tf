variable "key_name" {
  description = "The name for the key pair."
  type        = string
}

variable "public_key" {
  description = "The public key material."
  type        = string
}

variable "tags" {
  description = "Key-value map of resource tags."
  type        = map(string)
  default     = {}
}
