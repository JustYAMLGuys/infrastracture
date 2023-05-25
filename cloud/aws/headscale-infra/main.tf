module "instances" {
    source = "git::https://github.com/spiffyvmlab/terraform-backup.git//modules/ec2"
    
    for_each = { for inst in var.instances : inst.instance_name => inst }

    custom_ami           = each.value.custom_ami
    ami                  = each.value.ami
    instance_name        = each.value.instance_name
    instance_type        = each.value.instance_type
    #ec2_iam_role         = each.value.ec2_iam_role
    subnet_id            = each.value.subnet_id
    public_instance      = each.value.public_instance
    keypair_name         = module.key_pair.key_pair_name
    security_group_ids   = [module.security_group.security_group_id]
    root_volume_size     = each.value.root_volume_size
    root_volume_type     = each.value.root_volume_type
    secondary_volume_size = each.value.secondary_volume_size
    secondary_volume_type = each.value.secondary_volume_type
    tags = merge(var.required_tags, var.ec2_tags)
}

module "security_group" {
    source = "git::https://github.com/spiffyvmlab/terraform-backup.git//modules/security_group"

    sg_name = var.sg_name
    sg_description = var.sg_description
    vpc_id = var.vpc_id
    
    ingress_rules = [
    for rule in var.ingress_rules :
    {
      from_port         = rule.from_port
      to_port           = rule.to_port
      protocol          = rule.protocol
      self              = rule.self
      cidr_blocks       = rule.self ? [] : rule.cidr_blocks
      ipv6_cidr_blocks  = rule.self ? [] : rule.ipv6_cidr_blocks
      description       = rule.description
      security_groups = rule.self ? null : rule.security_groups
    }
  ]

  egress_rules = [
    for rule in var.egress_rules :
    {
      from_port         = rule.from_port
      to_port           = rule.to_port
      protocol          = rule.protocol
      self              = rule.self
      cidr_blocks       = rule.self ? [] : rule.cidr_blocks
      ipv6_cidr_blocks  = rule.self ? [] : rule.ipv6_cidr_blocks
      description       = rule.description
      security_groups = rule.self ? null : rule.security_groups
    }
  ]
    
    
    
    tags = merge(var.required_tags, var.sg_tags)

}

module "key_pair" {
    source = "git::https://github.com/spiffyvmlab/terraform-backup.git//modules/keypair"

    key_name = var.key_name
    public_key = var.public_key
    tags = merge(var.required_tags, var.keypair_tags)
}