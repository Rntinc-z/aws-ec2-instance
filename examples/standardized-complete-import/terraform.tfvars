# ==============================================================================
# STANDARDIZED TERRAFORM VARIABLES FOR EC2 INSTANCE MODULE
# ==============================================================================
# This file contains ONLY variables that actually exist in the 
# terraform-aws-ec2-instance module v5.6.0 to prevent validation errors.
# ==============================================================================

# ==============================================================================
# MODULE SOURCE CONFIGURATION (Custom variable for standardization)
# ==============================================================================

module_source = "git::https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git?ref=v5.6.0"

# ==============================================================================
# IMPORT-SPECIFIC VARIABLES (Custom variables for import operations)
# ==============================================================================

# Uncomment and set these when importing existing resources
# instance_id                 = "i-1234567890abcdef0"
# existing_security_group_id  = "sg-1234567890abcdef0"
# existing_iam_role_name      = "existing-ec2-role"

# ==============================================================================
# BASIC CONFIGURATION
# ==============================================================================

create = true
name   = "my-ec2-instance"
region = "us-east-1"

# ==============================================================================
# AMI AND INSTANCE TYPE CONFIGURATION
# ==============================================================================

ami                = null # Will use ami_ssm_parameter
ami_ssm_parameter  = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
ignore_ami_changes = false
instance_type      = "t3.medium"

# ==============================================================================
# NETWORK CONFIGURATION
# ==============================================================================

associate_public_ip_address = false
availability_zone           = "us-east-1a"
subnet_id                   = "subnet-1234567890abcdef0"
vpc_security_group_ids      = ["sg-1234567890abcdef0"]
private_ip                  = null
secondary_private_ips       = null
ipv6_address_count          = null
ipv6_addresses              = null
enable_primary_ipv6         = null
source_dest_check           = true

# ==============================================================================
# STORAGE CONFIGURATION
# ==============================================================================

ebs_optimized = true

root_block_device = {
  delete_on_termination = true
  encrypted             = true
  size                  = 30
  type                  = "gp3"
  throughput            = 125
  iops                  = 3000
  tags = {
    Name = "root-volume"
    Type = "system"
  }
}

ebs_volumes = {
  "/dev/sdf" = {
    size           = 50
    type           = "gp3"
    throughput     = 200
    iops           = 4000
    encrypted      = true
    final_snapshot = true
    tags = {
      Name = "data-volume"
      Type = "application-data"
    }
  }
}

ephemeral_block_device = null

# ==============================================================================
# SECURITY AND ACCESS CONFIGURATION
# ==============================================================================

key_name                = "my-keypair"
get_password_data       = false
iam_instance_profile    = null
disable_api_termination = false
disable_api_stop        = false

# ==============================================================================
# METADATA AND MONITORING CONFIGURATION
# ==============================================================================

metadata_options = {
  http_endpoint               = "enabled"
  http_protocol_ipv6          = "disabled"
  http_put_response_hop_limit = 1
  http_tokens                 = "required"
  instance_metadata_tags      = "enabled"
}

monitoring              = true
enclave_options_enabled = false

# ==============================================================================
# ADVANCED CONFIGURATION
# ==============================================================================

cpu_options = null
cpu_credits = "standard"

capacity_reservation_specification = null

hibernation                = false
host_id                    = null
host_resource_group_arn    = null
tenancy                    = "default"
placement_group            = null
placement_partition_number = null

# ==============================================================================
# LIFECYCLE AND MAINTENANCE
# ==============================================================================

instance_initiated_shutdown_behavior = "stop"

maintenance_options = {
  auto_recovery = "default"
}

private_dns_name_options = null

# ==============================================================================
# USER DATA AND INITIALIZATION
# ==============================================================================

user_data                   = null
user_data_base64            = null
user_data_replace_on_change = false

# ==============================================================================
# SPOT INSTANCE CONFIGURATION
# ==============================================================================

create_spot_instance                = false
spot_price                          = null
spot_wait_for_fulfillment           = null
spot_type                           = null
spot_instance_interruption_behavior = null
spot_launch_group                   = null
spot_valid_from                     = null
spot_valid_until                    = null

# ==============================================================================
# NETWORK INTERFACE CONFIGURATION
# ==============================================================================

network_interface = null

# ==============================================================================
# LAUNCH TEMPLATE CONFIGURATION
# ==============================================================================

launch_template         = null
instance_market_options = null

# ==============================================================================
# TAGGING CONFIGURATION
# ==============================================================================

tags = {
  Environment = "production"
  Project     = "my-project"
  Owner       = "infrastructure-team"
  ManagedBy   = "terraform"
  CostCenter  = "engineering"
}

instance_tags = {
  "patch-group" = "web-servers"
  "monitoring"  = "enabled"
}

volume_tags = {
  "backup-schedule" = "daily"
  "encryption"      = "required"
}

enable_volume_tags = true

# ==============================================================================
# TIMEOUT CONFIGURATION
# ==============================================================================

timeouts = {
  create = "10m"
  update = "10m"
  delete = "20m"
}

# ==============================================================================
# IAM ROLE AND INSTANCE PROFILE CONFIGURATION
# ==============================================================================

create_iam_instance_profile   = true
iam_role_name                 = null
iam_role_use_name_prefix      = true
iam_role_path                 = "/"
iam_role_description          = "IAM role for EC2 instance"
iam_role_permissions_boundary = null

iam_role_policies = {
  CloudWatchAgentServerPolicy = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  SSMManagedInstanceCore      = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

iam_role_tags = {
  Purpose = "ec2-instance-role"
}

# ==============================================================================
# SECURITY GROUP CONFIGURATION
# ==============================================================================

create_security_group          = true
security_group_name            = null
security_group_use_name_prefix = true
security_group_description     = "Security group for EC2 instance"
security_group_vpc_id          = null

security_group_tags = {
  Purpose = "ec2-instance-sg"
}

security_group_egress_rules = {
  all_traffic = {
    cidr_ipv4   = "0.0.0.0/0"
    description = "Allow all outbound traffic"
    ip_protocol = "-1"
  }
}

security_group_ingress_rules = {
  ssh = {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr_ipv4   = "10.0.0.0/8"
    description = "SSH access from VPC"
  }
  http = {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr_ipv4   = "10.0.0.0/8"
    description = "HTTP access from VPC"
  }
  https = {
    from_port   = 443
    to_port     = 443
    ip_protocol = "tcp"
    cidr_ipv4   = "10.0.0.0/8"
    description = "HTTPS access from VPC"
  }
}

# ==============================================================================
# ELASTIC IP CONFIGURATION
# ==============================================================================

create_eip = false
eip_domain = "vpc"

eip_tags = {
  Purpose = "ec2-instance-eip"
}

# ==============================================================================
# LEGACY/COMPATIBILITY VARIABLES
# ==============================================================================

putin_khuylo = true
