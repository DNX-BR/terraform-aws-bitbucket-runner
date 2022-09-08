variable "vpc_id" {
  description = "The target VPC for the docker-machine and runner instances."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnets used for hosting the runner."
  type        = list(string)
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
  default = 0
}

variable "on_demand_percentage" {
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
  default = true
}

variable "root_volume_iops" {
  default = 3000
}

variable "root_volume_size" {
  default = 100
}

variable "root_volume_type" {
  default = "gp3"
}

variable "root_volume_throughput" {
  default = 125
}

variable "root_volume_delete_on_termination" {
  default = true
}