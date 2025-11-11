variable "region" {
  description = "AWS region"
  type        = string
  default     = "cn-northwest-1"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "private_ip" {
  description = "Private IP address"
  type        = string
}

variable "ebs_optimized" {
  description = "Enable EBS optimization"
  type        = bool
  default     = true
}

variable "monitoring" {
  description = "Enable detailed monitoring"
  type        = bool
  default     = false
}

variable "cpu_core_count" {
  description = "Number of CPU cores"
  type        = number
  default     = 1
}

variable "cpu_threads_per_core" {
  description = "Number of threads per core"
  type        = number
  default     = 2
}

variable "metadata_http_endpoint" {
  description = "Metadata HTTP endpoint"
  type        = string
  default     = "enabled"
}

variable "metadata_http_tokens" {
  description = "Metadata HTTP tokens"
  type        = string
  default     = "required"
}

variable "metadata_hop_limit" {
  description = "Metadata hop limit"
  type        = number
  default     = 2
}

variable "metadata_instance_tags" {
  description = "Enable instance metadata tags"
  type        = string
  default     = "disabled"
}

variable "root_volume_type" {
  description = "Root volume type"
  type        = string
  default     = "gp3"
}

variable "root_volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 30
}

variable "root_volume_iops" {
  description = "Root volume IOPS"
  type        = number
  default     = 3000
}

variable "root_volume_throughput" {
  description = "Root volume throughput"
  type        = number
  default     = 125
}

variable "root_volume_encrypted" {
  description = "Encrypt root volume"
  type        = bool
  default     = false
}

variable "root_delete_on_termination" {
  description = "Delete root volume on termination"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}