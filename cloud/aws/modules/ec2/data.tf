## Lookup AMI info
data "aws_ami" "latest" {
  most_recent = true
  owners      = var.custom_ami == "" ? ["amazon"] : ["self"]

  filter {
    name   = "name"
    values = var.custom_ami == "" ? [var.default_ami[var.ami]["name"]] : ["*"]
  }

  dynamic "filter" {
    for_each = var.custom_ami == "" ? [] : [var.custom_ami]
    content {
      name   = "image-id"
      values = filter.value
    }
  }

  filter {
    name   = "architecture"
    values = can(regex("g", var.instance_type)) ? ["arm64"] : ["x86_64"]
  }
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}
