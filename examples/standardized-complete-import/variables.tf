# ==============================================================================
# STANDARDIZED TERRAFORM VARIABLES FOR EC2 INSTANCE MODULE
# ==============================================================================
# This file contains ALL variables used in the standardized complete import example
# ==============================================================================

# ==============================================================================
# MODULE SOURCE CONFIGURATION (Custom variable for standardization)
# ==============================================================================

variable "module_source" {
  description = "Source path for the EC2 instance module"
  type        = string
  default     = "git::https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git?ref=v5.6.0"
}

# ==============================================================================
# IMPORT-SPECIFIC VARIABLES (Custom variables for import operations)
# ==============================================================================

variable "instance_id" {
  description = "ID of existing EC2 instance to import"
  type        = string
  default     = null
}

variable "existing_security_group_id" {
  description = "ID of existing security group to import"
  type        = string
  default     = null
}

variable "existing_iam_role_name" {
  description = "Name of existing IAM role to import"
  type        = string
  default     = null
}

# ==============================================================================
# BASIC CONFIGURATION
# ==============================================================================

variable "create" {
  description = "Whether to create EC2 instance"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "my-ec2-instance"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# ==============================================================================
# AMI AND INSTANCE TYPE CONFIGURATION
# ==============================================================================

variable "ami" {
  description = "AMI ID for the instance"
  type        = string
  default     = null
}

variable "ami_ssm_parameter" {
  description = "SSM parameter name for AMI ID"
  type        = string
  default     = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

variable "ignore_ami_changes" {
  description = "Whether to ignore AMI changes"
  type        = bool
  default     = false
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.medium"
}

# ==============================================================================
# NETWORK CONFIGURATION
# ==============================================================================

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address"
  type        = bool
  default     = false
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
  default     = []
}

variable "private_ip" {
  description = "Private IP address"
  type        = string
  default     = null
}

variable "secondary_private_ips" {
  description = "List of secondary private IP addresses"
  type        = list(string)
  default     = null
}

variable "ipv6_address_count" {
  description = "Number of IPv6 addresses"
  type        = number
  default     = null
}

variable "ipv6_addresses" {
  description = "List of IPv6 addresses"
  type        = list(string)
  default     = null
}

variable "enable_primary_ipv6" {
  description = "Enable primary IPv6 address"
  type        = bool
  default     = null
}

variable "source_dest_check" {
  description = "Enable source/destination checking"
  type        = bool
  default     = true
}

# ==============================================================================
# STORAGE CONFIGURATION
# ==============================================================================

variable "ebs_optimized" {
  description = "Enable EBS optimization"
  type        = bool
  default     = true
}

variable "root_block_device" {
  description = "Root block device configuration"
  type        = any
  default     = {}
}

variable "ebs_volumes" {
  description = "Additional EBS volumes"
  type        = any
  default     = {}
}

variable "ephemeral_block_device" {
  description = "Ephemeral block device configuration"
  type        = any
  default     = null
}

# ==============================================================================
# SECURITY AND ACCESS CONFIGURATION
# ==============================================================================

variable "key_name" {
  description = "Key pair name"
  type        = string
  default     = null
}

variable "get_password_data" {
  description = "Whether to get password data"
  type        = bool
  default     = false
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
  default     = null
}

variable "disable_api_termination" {
  description = "Disable API termination"
  type        = bool
  default     = false
}

variable "disable_api_stop" {
  description = "Disable API stop"
  type        = bool
  default     = false
}

# ==============================================================================
# METADATA AND MONITORING CONFIGURATION
# ==============================================================================

variable "metadata_options" {
  description = "Instance metadata options"
  type        = any
  default     = {}
}

variable "monitoring" {
  description = "Enable detailed monitoring"
  type        = bool
  default     = false
}

variable "enclave_options_enabled" {
  description = "Enable Nitro Enclaves"
  type        = bool
  default     = false
}

# ==============================================================================
# ADVANCED CONFIGURATION
# ==============================================================================

variable "cpu_options" {
  description = "CPU options"
  type        = any
  default     = null
}

variable "cpu_credits" {
  description = "CPU credits for burstable instances"
  type        = string
  default     = "standard"
}

variable "capacity_reservation_specification" {
  description = "Capacity reservation specification"
  type        = any
  default     = null
}

variable "hibernation" {
  description = "Enable hibernation"
  type        = bool
  default     = false
}

variable "host_id" {
  description = "Dedicated host ID"
  type        = string
  default     = null
}

variable "host_resource_group_arn" {
  description = "Host resource group ARN"
  type        = string
  default     = null
}

variable "tenancy" {
  description = "Instance tenancy"
  type        = string
  default     = "default"
}

variable "placement_group" {
  description = "Placement group name"
  type        = string
  default     = null
}

variable "placement_partition_number" {
  description = "Placement partition number"
  type        = number
  default     = null
}

# ==============================================================================
# LIFECYCLE AND MAINTENANCE
# ==============================================================================

variable "instance_initiated_shutdown_behavior" {
  description = "Instance initiated shutdown behavior"
  type        = string
  default     = "stop"
}

variable "maintenance_options" {
  description = "Maintenance options"
  type        = any
  default     = {}
}

variable "private_dns_name_options" {
  description = "Private DNS name options"
  type        = any
  default     = null
}

# ==============================================================================
# USER DATA AND INITIALIZATION
# ==============================================================================

variable "user_data" {
  description = "User data script"
  type        = string
  default     = null
}

variable "user_data_base64" {
  description = "Base64 encoded user data"
  type        = string
  default     = null
}

variable "user_data_replace_on_change" {
  description = "Replace instance on user data change"
  type        = bool
  default     = false
}

# ==============================================================================
# SPOT INSTANCE CONFIGURATION
# ==============================================================================

variable "create_spot_instance" {
  description = "Create spot instance"
  type        = bool
  default     = false
}

variable "spot_price" {
  description = "Spot instance price"
  type        = string
  default     = null
}

variable "spot_wait_for_fulfillment" {
  description = "Wait for spot fulfillment"
  type        = bool
  default     = null
}

variable "spot_type" {
  description = "Spot instance type"
  type        = string
  default     = null
}

variable "spot_instance_interruption_behavior" {
  description = "Spot instance interruption behavior"
  type        = string
  default     = null
}

variable "spot_launch_group" {
  description = "Spot launch group"
  type        = string
  default     = null
}

variable "spot_valid_from" {
  description = "Spot request valid from"
  type        = string
  default     = null
}

variable "spot_valid_until" {
  description = "Spot request valid until"
  type        = string
  default     = null
}

# ==============================================================================
# NETWORK INTERFACE CONFIGURATION
# ==============================================================================

variable "network_interface" {
  description = "Network interface configuration"
  type        = any
  default     = null
}

# ==============================================================================
# LAUNCH TEMPLATE CONFIGURATION
# ==============================================================================

variable "launch_template" {
  description = "Launch template configuration"
  type        = any
  default     = null
}

variable "instance_market_options" {
  description = "Instance market options"
  type        = any
  default     = null
}

# ==============================================================================
# TAGGING CONFIGURATION
# ==============================================================================

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "instance_tags" {
  description = "Additional tags for the instance"
  type        = map(string)
  default     = {}
}

variable "volume_tags" {
  description = "Tags for volumes"
  type        = map(string)
  default     = {}
}

variable "enable_volume_tags" {
  description = "Enable volume tags"
  type        = bool
  default     = true
}

# ==============================================================================
# TIMEOUT CONFIGURATION
# ==============================================================================

variable "timeouts" {
  description = "Timeout configuration"
  type        = any
  default     = {}
}

# ==============================================================================
# IAM ROLE AND INSTANCE PROFILE CONFIGURATION
# ==============================================================================

variable "create_iam_instance_profile" {
  description = "Create IAM instance profile"
  type        = bool
  default     = false
}

variable "iam_role_name" {
  description = "IAM role name"
  type        = string
  default     = null
}

variable "iam_role_use_name_prefix" {
  description = "Use name prefix for IAM role"
  type        = bool
  default     = true
}

variable "iam_role_path" {
  description = "IAM role path"
  type        = string
  default     = "/"
}

variable "iam_role_description" {
  description = "IAM role description"
  type        = string
  default     = null
}

variable "iam_role_permissions_boundary" {
  description = "IAM role permissions boundary"
  type        = string
  default     = null
}

variable "iam_role_policies" {
  description = "IAM role policies"
  type        = map(string)
  default     = {}
}

variable "iam_role_tags" {
  description = "IAM role tags"
  type        = map(string)
  default     = {}
}

# ==============================================================================
# SECURITY GROUP CONFIGURATION
# ==============================================================================

variable "create_security_group" {
  description = "Create security group"
  type        = bool
  default     = false
}

variable "security_group_name" {
  description = "Security group name"
  type        = string
  default     = null
}

variable "security_group_use_name_prefix" {
  description = "Use name prefix for security group"
  type        = bool
  default     = true
}

variable "security_group_description" {
  description = "Security group description"
  type        = string
  default     = null
}

variable "security_group_vpc_id" {
  description = "VPC ID for security group"
  type        = string
  default     = null
}

variable "security_group_tags" {
  description = "Security group tags"
  type        = map(string)
  default     = {}
}

variable "security_group_egress_rules" {
  description = "Security group egress rules"
  type        = any
  default     = {}
}

variable "security_group_ingress_rules" {
  description = "Security group ingress rules"
  type        = any
  default     = {}
}

# ==============================================================================
# ELASTIC IP CONFIGURATION
# ==============================================================================

variable "create_eip" {
  description = "Create Elastic IP"
  type        = bool
  default     = false
}

variable "eip_domain" {
  description = "EIP domain"
  type        = string
  default     = "vpc"
}

variable "eip_tags" {
  description = "EIP tags"
  type        = map(string)
  default     = {}
}

# ==============================================================================
# LEGACY/COMPATIBILITY VARIABLES
# ==============================================================================

variable "putin_khuylo" {
  description = "Legacy compatibility variable"
  type        = bool
  default     = true
}