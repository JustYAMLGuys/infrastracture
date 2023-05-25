<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_instances"></a> [instances](#module\_instances) | git::https://github.com/JustYAMLGuys/infrastracture.git//cloud/aws/modules/ec2 | n/a |
| <a name="module_key_pair"></a> [key\_pair](#module\_key\_pair) | git::https://github.com/JustYAMLGuys/infrastracture.git//cloud/aws/modules/keypair | n/a |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | git::https://github.com/JustYAMLGuys/infrastracture.git//cloud/aws/modules/security_group | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ec2_tags"></a> [ec2\_tags](#input\_ec2\_tags) | A map of tags that should be applied to all EC2 instances | `map(string)` | `{}` | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | List of egress rules | <pre>list(object({<br>    description      = string<br>    from_port        = number<br>    to_port          = number<br>    protocol         = string<br>    cidr_blocks      = list(string)<br>    ipv6_cidr_blocks = list(string)<br>    security_groups  = string<br>    self             = bool<br>  }))</pre> | `[]` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | List of ingress rules | <pre>list(object({<br>    description      = string<br>    from_port        = number<br>    to_port          = number<br>    protocol         = string<br>    cidr_blocks      = list(string)<br>    ipv6_cidr_blocks = list(string)<br>    security_groups  = string<br>    self             = bool<br>  }))</pre> | `[]` | no |
| <a name="input_instances"></a> [instances](#input\_instances) | List of instances to create | <pre>list(object({<br>    custom_ami       = string<br>    ami              = string<br>    instance_name    = string<br>    #ec2_iam_role     = string<br>    instance_type    = string<br>    subnet_id        = string<br>    public_instance  = bool<br>    root_volume_size   = number<br>    root_volume_type   = string<br>    secondary_volume_size = number<br>    secondary_volume_type = string<br>    secondary_volume_mount_point = string<br>  }))</pre> | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The name for the key pair. | `string` | n/a | yes |
| <a name="input_keypair_tags"></a> [keypair\_tags](#input\_keypair\_tags) | A map of tags that should be applied to the key pair | `map(string)` | `{}` | no |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | The public key material. | `string` | n/a | yes |
| <a name="input_required_tags"></a> [required\_tags](#input\_required\_tags) | A map of tags that should be applied to all resources | `map(string)` | `{}` | no |
| <a name="input_sg_description"></a> [sg\_description](#input\_sg\_description) | Description of the security group | `string` | `"Managed by Terraform"` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | Name of the security group | `string` | n/a | yes |
| <a name="input_sg_tags"></a> [sg\_tags](#input\_sg\_tags) | A map of tags that should be applied to the security group | `map(string)` | `{}` | no |
| <a name="input_use_eip"></a> [use\_eip](#input\_use\_eip) | Whether to use an Elastic IP address | `bool` | `false` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ami_id"></a> [ami\_id](#output\_ami\_id) | value of data.aws\_ami.latest.id for each instance |
<!-- END_TF_DOCS -->