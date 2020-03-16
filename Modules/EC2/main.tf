resource "aws_instance" "ec2" {
  count                  = var.instance_count
  ami                    = var.ami
  instance_type          = var.instance_type
  user_data              = var.user_data
  user_data_base64       = var.user_data_base64
  subnet_id              = element(var.subnet_ids, count.index)
  key_name               = var.key_name
  monitoring             = var.monitoring
  vpc_security_group_ids = length(var.vpc_security_group_ids) > 0 ? var.vpc_security_group_ids : null
  iam_instance_profile   = var.iam_instance_profile

  associate_public_ip_address = var.associate_public_ip_address
  private_ip                  = length(var.private_ips) > 0 ? element(var.private_ips, count.index) : null
  tags                        = merge(var.tags, map("Name", var.name))
  disable_api_termination     = var.disable_api_termination
  tenancy                     = var.tenancy

  volume_tags   = merge(var.volume_tags, map("Name", var.name))
  ebs_optimized = var.ebs_optimized

}
