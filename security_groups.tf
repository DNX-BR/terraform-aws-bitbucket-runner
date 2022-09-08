resource "aws_security_group" "bitbucket_runner" {
  name        = "bitbucket-runner"
  description = "A security group for bitbucket-runner"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
