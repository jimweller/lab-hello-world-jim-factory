terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~> 1.0"

  backend "s3" {
    bucket="fcc-demo-hello-world-artifacts"
    key    = format("terraform/hello-%s.tfstate",var.me)
    region = "us-east-1"
  }
}
