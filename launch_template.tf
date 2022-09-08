data "template_file" "userdata" {
  template = file("${path.module}/user-data.tpl")
  vars = {
    userdata_extra = var.userdata
  }
}

resource "aws_launch_template" "bitbucket_runner" {
  name     = "lt-bitbucket-runner"
  image_id = data.aws_ami.amzn.id
  #   instance_type = var.instance_type

  ebs_optimized = var.runner_instance_ebs_optimized
  user_data     = base64encode(data.template_file.userdata.rendered)

  iam_instance_profile {
    name = var.iam_instance_profile
  }

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_type           = var.root_volume_type
      volume_size           = var.root_volume_size
      encrypted             = var.root_volume_encrypted
      iops                  = var.root_volume_iops
      throughput            = var.root_volume_throughput
      delete_on_termination = var.root_volume_delete_on_termination
    }
  }

  network_interfaces {
    security_groups = [aws_security_group.bitbucket_runner.id]
  }

  lifecycle {
    create_before_destroy = true
  }
}
