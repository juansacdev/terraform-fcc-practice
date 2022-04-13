terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
  # Static Credentials are a Bad Practice
  access_key = ""
  secret_key = ""
}

# resource "<provider>_<resource_type>" "<variable_name>" {}

resource "aws_vpc" "first_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Prod-vpc"
  }
}

resource "aws_subnet" "subnet_one" {
  vpc_id     = aws_vpc.first_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Prod-subnet"
  }
}

resource "aws_instance" "my-little-instance" {
  ami           = "ami-01f87c43e618bf8f0"
  instance_type = "t2.micro"
}
