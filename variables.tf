# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "Available cidr blocks for public subnets"
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24"
  ]
}

variable "private_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets"
  type        = list(string)
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
    "10.0.105.0/24",
    "10.0.106.0/24",
    "10.0.107.0/24",
    "10.0.108.0/24"
  ]
}

variable "instances_per_subnet" {
  description = "Number of EC2 instances per private subnet"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}

# Sensitive variables
variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}

# There are two ways of defining secret variables:
# 1. *.tfvars file
# 2. Environmental variables in linux

# 1) define variables in *.tfvars, e.g., secret.tfvars
# db_username = "admin"
# db_password = "insecurepassword"
# invoke TF with a parameter, because it is not a standard name for tfvars file
# terraform apply -var-file="secret.tfvars"

# https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables#set-values-with-variables
# 2) When Terraform runs, it looks in your environment for variables 
# that match the pattern TF_VAR_<VARIABLE_NAME>, 
# and assigns those values to the corresponding Terraform variables 
# in your configuration.
# export TF_VAR_db_username=admin TF_VAR_db_password=adifferentpassword
