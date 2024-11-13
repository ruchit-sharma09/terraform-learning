terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# S3 Bucket creation using string and map variables
resource "aws_s3_bucket" "ruchit_bucket" {
  bucket = "${replace(var.example_string, "0903", "-")}-bucket"
  tags = {
    Name        = var.example_map["name"]
    Environment = "Development"
  }
}

# Security Group using a set variable for allowed ingress rules
resource "aws_security_group" "ruchit_sg" {
  name        = "${var.example_string}_sg"
  description = "Security group for example EC2 instance"
  vpc_id      = data.aws_vpc.default.id  # Use default VPC

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Data source for default VPC
data "aws_vpc" "default" {
  default = true
}

`
# EC2 Instance creation using multiple variable types
resource "aws_instance" "ruchit_instance" {
  ami           = "ami-063d43db0594b521b"  # Example Amazon Linux AMI
  instance_type = "t2.micro"

  tags = {
    Name    = var.example_map["name"]
    Owner   = var.example_map["email"]
    Project = var.example_tuple[0]  # "Terraform"
  }

  # Key-value pair demonstration
  metadata_options {
    http_endpoint = var.example_bool ? "enabled" : "disabled"
  }

  # Block device configuration as a tuple
  root_block_device {
    volume_size           = var.example_tuple[1] # 101 GB
    delete_on_termination = var.example_tuple[2] # true
  }

  # Use of object variable
  user_data = <<EOF
#!/bin/bash
echo "Welcome, ${var.example_object.name}!"
EOF
}