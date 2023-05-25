instances = [
  {
    custom_ami = ""
    ami = "amazon-linux"
    instance_name = "iperf-server"
    instance_type = "t4g.small"
    #ec2_iam_role = ""
    subnet_id = "subnet-02065037737ecf438"
    public_instance = true
    root_volume_size = 16
    root_volume_type = "gp3"
    secondary_volume_size = "0"
    secondary_volume_type = ""
    secondary_volume_mount_point = ""
    use_eip = true
  }
  // Add more instances as needed
]

## Security Group definition (only needed if not re-using existing security groups)

sg_name = "iperf-server-sg"
sg_description = "This security group allows inbound iperf traffic from clients for latency and throughput testing"
vpc_id = "vpc-0868c56a1a9936ef4"

ingress_rules = [
  {
    description      = "Allow iPerf3 from anywhere TCP"
    from_port        = 5201
    to_port          = 5201
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    security_groups  = ""
    self             = false
  },
  {
    description      = "Allow iPerf3 from anywhere UDP"
    from_port        = 5201
    to_port          = 5201
    protocol         = "udp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    security_groups  = ""
    self             = false
  },
  {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Definitely need to update this later
    ipv6_cidr_blocks = []
    security_groups  = ""
    self             = false
  },
  {
    description      = "Allow all ICMP"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    ipv6_cidr_blocks = ["::/0"]
    cidr_blocks      = []
    security_groups  = ""
    self             = false
  }
]

egress_rules = [
  {
    description      = "All traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    security_groups  = ""
    self             = false
  }
]

sg_tags = {
  "Name" = "iperf-instance-sg"
}

### Key_pair definition (only needed if not re-using existing key pairs)

key_name = "iperf-frankfurt"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8NQADwWPEEm9s/yYkeNLEDWOu/7TUIDDxciGEkYj4Pto9CkngoMy7FDC7jDgmgg69hLr2Sosxj47vWawnpoPwcL2HVVu3IGc5NYjguhoJbb9CiZE44rRES795kEqJoI+/j38X/LsnMXb/4QvAV3YrNyffd31YigQw0QzoHp4F6LTArPizCJdNUWfEpox3VOWqr6bOH/Lr6aFwHsLTtkt2maOjq98yNaN5w07oFPKvBhfu1iNjtDxw8GCsrYJW519FZeRGDUVh3GixQj2ZPI0EcjPbRLSdmDYjWhkk3ZjSR+MtWECiLcf9MpnnJMFzC/coFxeIE3IV/818elTPGIZPk0Y9koqEd0NRgb8sXacdh0uXeJ85d/vX7T8zsAwi/mtgf8R3TwpGl+TmHfH3h8T55/FE0+WWx1WwCZlzymyKC06YweQuUmeDJ5OkVuKbYDQa/rumDCR8j4YXwk4PCNPUQHWMJMTZrcBbrtkwnlAzaU+pzQfV62ZYYjcEo55iBDc= nick@Nicks-MacBook-Pro.local"


### Global definitions ###
required_tags = {
  "project" = "JustYAMLGuys-testing"
  "environment" = "nonprod"
  "owner" = "Nick Bissel"
  "account" = "Spiffycloudlab2"
  "managed-by" = "terraform"
  "enddate" = "00/00/00"
  "applications" = "iPerf3"
  "ticket" = "NA"

}