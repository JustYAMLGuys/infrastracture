<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | List of egress rules | <pre>list(object({<br>    description      = string<br>    from_port        = number<br>    to_port          = number<br>    protocol         = string<br>    cidr_blocks      = list(string)<br>    ipv6_cidr_blocks = list(string)<br>    security_groups  = string<br>    self             = bool<br>  }))</pre> | `[]` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | List of ingress rules | <pre>list(object({<br>    description      = string<br>    from_port        = number<br>    to_port          = number<br>    protocol         = string<br>    cidr_blocks      = list(string)<br>    ipv6_cidr_blocks = list(string)<br>    security_groups  = string<br>    self             = bool<br>  }))</pre> | `[]` | no |
| <a name="input_sg_description"></a> [sg\_description](#input\_sg\_description) | Description of the security group | `string` | `"Managed by Terraform"` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | Name of the security group | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags that should be applied to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_description"></a> [security\_group\_description](#output\_security\_group\_description) | The description of the security group |
| <a name="output_security_group_egress_rules"></a> [security\_group\_egress\_rules](#output\_security\_group\_egress\_rules) | The egress rules of the security group |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group |
| <a name="output_security_group_ingress_rules"></a> [security\_group\_ingress\_rules](#output\_security\_group\_ingress\_rules) | The ingress rules of the security group |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | The name of the security group |
| <a name="output_security_group_vpc_id"></a> [security\_group\_vpc\_id](#output\_security\_group\_vpc\_id) | The VPC ID the security group is attached to |
<!-- END_TF_DOCS -->