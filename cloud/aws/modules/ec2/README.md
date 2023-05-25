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
| [aws_eip.eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.latest](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_subnet.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | Enter a string that matches one of the default values of var.default\_ami. If custom, specify the AMI name in var.custom\_ami | `string` | `"amazon-linux"` | no |
| <a name="input_custom_ami"></a> [custom\_ami](#input\_custom\_ami) | Custom AMI to use if var.ami is set to custom | `string` | `""` | no |
| <a name="input_default_ami"></a> [default\_ami](#input\_default\_ami) | Defines options for AMI selection | `map(any)` | <pre>{<br>  "amazon-linux": {<br>    "ami_id": "*",<br>    "name": "amzn2-ami-hvm-*"<br>  },<br>  "custom": {<br>    "ami_id": "",<br>    "name": ""<br>  },<br>  "windows-2019": {<br>    "ami_id": "*",<br>    "name": "Windows_Server-2019-English-Full-Base-*"<br>  },<br>  "windows-2019-sql": {<br>    "ami_id": "*",<br>    "name": "Windows_Server-2019-English-Full-SQL_2019_Standard-*"<br>  },<br>  "windows-2022": {<br>    "ami_id": "*",<br>    "name": "Windows_Server-2022-English-Full-Base-*"<br>  },<br>  "windows-2022-sql": {<br>    "ami_id": "*",<br>    "name": "Windows_Server-2022-English-Full-SQL_2019_Standard-*"<br>  }<br>}</pre> | no |
| <a name="input_ec2_iam_role"></a> [ec2\_iam\_role](#input\_ec2\_iam\_role) | IAM role to apply to the EC2 instance | `string` | `""` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the EC2 instance | `string` | `"my-ec2-instance"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Type of the EC2 instance | `string` | `"t2.micro"` | no |
| <a name="input_keypair_name"></a> [keypair\_name](#input\_keypair\_name) | Name of the keypair to use for the EC2 instance | `string` | `""` | no |
| <a name="input_public_instance"></a> [public\_instance](#input\_public\_instance) | Whether to launch the EC2 instance with a public IP address | `bool` | `false` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | Size of the root volume in GB | `number` | `8` | no |
| <a name="input_root_volume_type"></a> [root\_volume\_type](#input\_root\_volume\_type) | Type of the root volume | `string` | `"gp3"` | no |
| <a name="input_secondary_volume_mount_point"></a> [secondary\_volume\_mount\_point](#input\_secondary\_volume\_mount\_point) | Mount point of the secondary volume | `string` | `"/dev/sdb"` | no |
| <a name="input_secondary_volume_size"></a> [secondary\_volume\_size](#input\_secondary\_volume\_size) | Size of the secondary volume in GB | `number` | `0` | no |
| <a name="input_secondary_volume_type"></a> [secondary\_volume\_type](#input\_secondary\_volume\_type) | Type of the secondary volume | `string` | `"gp3"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of security group IDs to apply to the EC2 instance | `list(string)` | `[]` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID to launch the EC2 instance in | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to all resources | `map` | <pre>{<br>  "Environment": "dev",<br>  "Terraform": "true"<br>}</pre> | no |
| <a name="input_use_eip"></a> [use\_eip](#input\_use\_eip) | Whether to use an Elastic IP address | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ami_id"></a> [ami\_id](#output\_ami\_id) | AMI ID |
<!-- END_TF_DOCS -->