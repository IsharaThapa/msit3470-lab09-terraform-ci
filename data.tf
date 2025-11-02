locals {
  # Detect whether running inside GitHub Actions CI
  is_ci = try(env.GITHUB_ACTIONS, "") != ""
}

# Only fetch AMI when not in CI
data "aws_ami" "amazon_linux" {
  count       = local.is_ci ? 0 : 1
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Dummy AMI for CI mode
locals {
  ami_id = local.is_ci ? "ami-placeholder" : data.aws_ami.amazon_linux[0].id
}
