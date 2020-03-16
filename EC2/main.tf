provider "aws" {
  version = "~> 2.0"
  region  = "us-west-1"
  access_key = "<aws_access_key>"
  secret_key = "<aws_secret_key>"
}

module "ec2" {
  instance_count         = 1
  source                 = "../Modules/EC2"
  name                   = "Tibco"

  ami                    = "ami-000b48d2b508d571d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["<security group id>"]
  subnet_ids              = ["subnet_ids"]

  tags = {
    Infra   = "true"
    Environment = "uat"
  }
}
