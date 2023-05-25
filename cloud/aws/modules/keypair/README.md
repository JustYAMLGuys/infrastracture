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
| [aws_key_pair.key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The name for the key pair. | `string` | n/a | yes |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | The public key material. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of resource tags. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fingerprint"></a> [fingerprint](#output\_fingerprint) | The MD5 public key fingerprint. |
| <a name="output_key_pair_arn"></a> [key\_pair\_arn](#output\_key\_pair\_arn) | The key pair ARN. |
| <a name="output_key_pair_id"></a> [key\_pair\_id](#output\_key\_pair\_id) | The key pair ID. |
| <a name="output_key_pair_name"></a> [key\_pair\_name](#output\_key\_pair\_name) | The key pair name. |
| <a name="output_key_type"></a> [key\_type](#output\_key\_type) | The type of key pair. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource. |
<!-- END_TF_DOCS -->