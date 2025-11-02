locals {
  is_ci = (length(get_env("GITHUB_ACTIONS", "")) > 0)
}

# In local runs, fetch AMI normally.
# In CI (GitHub Actions), skip this data block entirely.
data "aws_ami" "amazon_linux" {
  count       = local.is_ci ? 0 : 1
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
