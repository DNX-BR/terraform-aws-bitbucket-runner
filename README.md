## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| architecture | Architecture to select the AMI, x86\_64 or arm64 | `string` | `"x86_64"` | no |
| iam\_instance\_profile | IAM instance profile name of the runner. | `string` | `""` | no |
| instance\_types | Instance type for ECS workers | `list(any)` | `[]` | no |
| on\_demand\_base\_capacity | Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances | `number` | `0` | no |
| on\_demand\_percentage | Percentage split between on-demand and Spot instances above the base on-demand capacity | `number` | `0` | no |
| root\_volume\_delete\_on\_termination | Whether the volume should be destroyed on instance termination | `bool` | `true` | no |
| root\_volume\_encrypted | Enables EBS encryption on the volume | `bool` | `true` | no |
| root\_volume\_iops | The amount of provisioned IOPS | `number` | `3000` | no |
| root\_volume\_size | The size of the volume in gigabytes | `number` | `100` | no |
| root\_volume\_throughput | The throughput to provision for a gp3 volume in MiB/s (specified as an integer, e.g., 500), with a maximum of 1,000 MiB/s | `number` | `125` | no |
| root\_volume\_type | The volume type. Can be standard, gp2, gp3, io1, io2, sc1 or st1 | `string` | `"gp3"` | no |
| runner\_instance\_ebs\_optimized | Enable the GitLab runner instance to be EBS-optimized. | `bool` | `true` | no |
| runner\_root\_block\_device | The EC2 instance root block device configuration. Takes the following keys: `delete_on_termination`, `volume_type`, `volume_size`, `encrypted`, `iops` | `map(string)` | `{}` | no |
| subnet\_ids | List of subnets used for hosting the runner. | `any` | n/a | yes |
| userdata | Extra commands to pass to userdata. | `string` | `""` | no |
| vpc\_id | The target VPC for the docker-machine and runner instances. | `string` | n/a | yes |

## Outputs

No output.