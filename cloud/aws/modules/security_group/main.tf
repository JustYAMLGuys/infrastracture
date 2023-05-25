resource "aws_security_group" "this" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

locals {
  ingress_rules_map = { for idx, val in var.ingress_rules : idx => val }
  egress_rules_map = { for idx, val in var.egress_rules : idx => val }
}

resource "aws_security_group_rule" "ingress_rules" {
  for_each = local.ingress_rules_map

  type                     = "ingress"
  description              = each.value.description
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  security_group_id        = aws_security_group.this.id
  source_security_group_id = each.value.self != null ? null : lookup(each.value, "security_groups", null)

  self          = each.value.self != null ? each.value.self : null
  cidr_blocks   = each.value.self != null ? null : each.value.cidr_blocks
  ipv6_cidr_blocks = each.value.self != null ? null : each.value.ipv6_cidr_blocks

  depends_on = [aws_security_group.this]

  timeouts {
    create = "1m"
  }
}

resource "aws_security_group_rule" "egress_rules" {
  for_each = local.egress_rules_map

  type                     = "egress"
  description              = each.value.description
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  security_group_id        = aws_security_group.this.id
  source_security_group_id = each.value.self != null ? null : lookup(each.value, "security_groups", null)

  self          = each.value.self != null ? each.value.self : null
  cidr_blocks   = each.value.self != null ? null : each.value.cidr_blocks
  ipv6_cidr_blocks = each.value.self != null ? null : each.value.ipv6_cidr_blocks

  depends_on = [aws_security_group.this]

  timeouts {
    create = "1m"
  }
}



