module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = format("hello-world-%s", var.me)
  ami_ssm_parameter	= "/aws/service/ami-windows-latest/Windows_Server-2022-English-Full-Base"
  instance_type          = "t2.micro"
  monitoring             = false
  vpc_security_group_ids = [data.aws_ssm_parameter.securitygroup_id.value]
  subnet_id              = data.aws_ssm_parameter.subnet_id.value

  associate_public_ip_address	= true

  # user_data = file("bootstrap.sh")

  iam_instance_profile	= data.aws_ssm_parameter.instance_profile_name.value

  key_name = "fcc-demo-hello-world-key"

  user_data_base64 = base64encode("${templatefile("bootstrap.ps1", {
    ME   = var.me
  })}")
}



# Get the parameters that we need to place this instance in the right subnet and
# allow RDP
data "aws_ssm_parameter" "subnet_id" {
    name = "/fcc-demo/hello-world/subnet-id"
}

data "aws_ssm_parameter" "securitygroup_id" {
    name = "/fcc-demo/hello-world/securitygroup-id"
}

data "aws_ssm_parameter" "instance_profile_name" {
    name        = "/fcc-demo/hello-world/instance-profile-name"
}