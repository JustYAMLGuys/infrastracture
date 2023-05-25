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
| [aws_eip.nat_gateway_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.my_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route53_zone.private_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_route_table.private_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.public_subnet_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.my_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | The CIDR block for the VPC | `string` | n/a | yes |
| <a name="input_cidr_route"></a> [cidr\_route](#input\_cidr\_route) | The CIDR block for the route | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | The common tags | `map(string)` | n/a | yes |
| <a name="input_create_private_subnets"></a> [create\_private\_subnets](#input\_create\_private\_subnets) | Whether to create private subnets | `bool` | `true` | no |
| <a name="input_create_zone"></a> [create\_zone](#input\_create\_zone) | Whether to create the Route53 zone | `bool` | `false` | no |
| <a name="input_newbits"></a> [newbits](#input\_newbits) | The new bits for the subnet size | `number` | n/a | yes |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | If true, a single NAT gateway will be created. If false, a NAT gateway will be created for each subnet. | `bool` | n/a | yes |
| <a name="input_subnet_count"></a> [subnet\_count](#input\_subnet\_count) | The number of subnets | `number` | n/a | yes |
| <a name="input_zone_comment"></a> [zone\_comment](#input\_zone\_comment) | The comment for the private zone | `string` | n/a | yes |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | The name of the private zone | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->