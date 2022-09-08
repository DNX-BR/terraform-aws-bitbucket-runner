resource "aws_autoscaling_group" "bitbucket_runner" {
  name                = "asg-bitbucket-runner"
  vpc_zone_identifier = var.subnet_ids

  min_size                  = "1"
  max_size                  = "1"
  desired_capacity          = "1"
  health_check_grace_period = 0

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.bitbucket_runner.id
        version            = "$Latest"
      }

      dynamic "override" {
        for_each = var.instance_types
        content {
          instance_type = override.value
        }
      }
    }

    instances_distribution {
      spot_instance_pools                      = 3
      on_demand_base_capacity                  = var.on_demand_base_capacity
      on_demand_percentage_above_base_capacity = var.on_demand_percentage
    }
  }

  tag {
    key                 = "Name"
    value               = "bitbucket-runner"
    propagate_at_launch = true
  }
}
