data "template_file" "userdata" {
  template = file("${path.module}/user-data.tpl")

  vars = {
    userdata_extra  = var.userdata
  }
}

resource "aws_launch_template" "bitbucket_runner" {
  name = "lt-bitbucket-runner"
  image_id    = data.aws_ami.amzn.id
  #   instance_type = var.instance_type

  ebs_optimized = var.runner_instance_ebs_optimized
  user_data = base64encode(data.template_file.userdata.rendered)

  iam_instance_profile {
    name = var.iam_instance_profile
  }

  block_device_mappings {
    dynamic "ebs" {
      for_each = [var.runner_root_block_device]
      content {
        delete_on_termination = lookup(root_block_device.value, "delete_on_termination", true)
        volume_type           = lookup(root_block_device.value, "volume_type", "gp3")
        volume_size           = lookup(root_block_device.value, "volume_size", 100)
        encrypted             = lookup(root_block_device.value, "encrypted", true)
        iops                  = lookup(root_block_device.value, "iops", 3000)
        throughput            = lookup(root_block_device.value, "throughput", 125)

      }
    }
  }

  network_interfaces {
    security_groups = [aws_security_group.runner.id]
  }

  lifecycle {
    create_before_destroy = true
  }
}
