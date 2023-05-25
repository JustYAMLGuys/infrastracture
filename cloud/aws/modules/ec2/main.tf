resource "aws_instance" "instance" {
    ## Base instance definitions
    ami                         = data.aws_ami.latest.id
    instance_type               = var.instance_type
        
    ## Network definitions
    subnet_id                   = var.subnet_id
    associate_public_ip_address = var.use_eip ? false : var.public_instance
    availability_zone           = data.aws_subnet.selected.availability_zone
    
    ## Security definitions
    key_name                    = var.keypair_name
    vpc_security_group_ids      = var.security_group_ids
    iam_instance_profile = var.ec2_iam_role
    
    ## Volume definitions
    root_block_device {
        volume_size = var.root_volume_size
        volume_type = var.root_volume_type
    }
    dynamic "ebs_block_device" {
        for_each = var.secondary_volume_size != 0 ? [1] : []
        content {
            device_name = can(regex("windows", var.ami)) ? (can(regex("dev/", var.secondary_volume_mount_point)) ? "xvdb" : var.secondary_volume_mount_point) : var.secondary_volume_mount_point
            volume_size = var.secondary_volume_size
            volume_type = var.secondary_volume_type
        }
    }
    
    ## Tag definitions
    tags = merge(
        var.tags,
        {
        "Name" = var.instance_name
        }
        )
    
    volume_tags = merge(
        var.tags, 
        {
        "Name" = var.instance_name
        }
    )

    lifecycle {
        ignore_changes = [
            tags,
            ami
        ]
    }
}

resource "aws_eip" "eip" {
    count = var.public_instance ? 1 : 0

    vpc = true
    instance = aws_instance.instance.id
    associate_with_private_ip = aws_instance.instance.private_ip
}