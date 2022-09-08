variable "vpc_id" {
  description = "The target VPC for the docker-machine and runner instances."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnets used for hosting the runner."
}

variable "instance_types" {
  description = "Instance type for ECS workers"
  type        = list(any)
  default     = []
}

variable "runner_instance_ebs_optimized" {
  description = "Enable the GitLab runner instance to be EBS-optimized."
  type        = bool
  default     = true
}

variable "iam_instance_profile" {
  description = "IAM instance profile name of the runner."
  type        = string
  default     = ""
}

variable "runner_root_block_device" {
  description = "The EC2 instance root block device configuration. Takes the following keys: `delete_on_termination`, `volume_type`, `volume_size`, `encrypted`, `iops`"
  type        = map(string)
  default     = {}
}

variable "on_demand_base_capacity" {
  description = "Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances"
  default = 0
}

variable "on_demand_percentage" {
  description = "Percentage split between on-demand and Spot instances above the base on-demand capacity"
  default = 0
}

variable "userdata" {
  default     = ""
  description = "Extra commands to pass to userdata."
}

variable "architecture" {
  default     = "x86_64"
  description = "Architecture to select the AMI, x86_64 or arm64"
}

variable "root_volume_encrypted" {
  description = "Enables EBS encryption on the volume"
  default = true
}

variable "root_volume_iops" {
  description = "The amount of provisioned IOPS"
  default = 3000
}

variable "root_volume_size" {
  description = "The size of the volume in gigabytes"
  default = 100
}

variable "root_volume_type" {
  description = "The volume type. Can be standard, gp2, gp3, io1, io2, sc1 or st1"
  default = "gp3"
}

variable "root_volume_throughput" {
  description = "The throughput to provision for a gp3 volume in MiB/s (specified as an integer, e.g., 500), with a maximum of 1,000 MiB/s"
  default = 125
}

variable "root_volume_delete_on_termination" {
  description = "Whether the volume should be destroyed on instance termination"
  default = true
}