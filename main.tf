terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
    access_key      = var.AWS_ACCESS_KEY
    secret_key      = var.AWS_SECRET_KEY
    region          = var.AWS_REGION
}

data "aws_vpc" "default_vpc" {
    default     = true
}

data "aws_security_group" "default_security_group" {
    id = var.security_group_id
}

data "aws_subnet_ids" "vpc_subnets" {
    vpc_id = data.aws_vpc.default_vpc.id
}

data "aws_subnet" "vpc_subnet_ids" {
  for_each = data.aws_subnet_ids.vpc_subnets.ids
  id       = each.value
}

# Update `aws_db_subnet_group` name
resource "aws_db_subnet_group" "default" {
    name                        = var.rds_instance_identifier
    subnet_ids                  = data.aws_subnet_ids.vpc_subnets.ids
}

resource "aws_db_instance" "rds" {
    allocated_storage           = 10
    backup_retention_period     = 7
    db_subnet_group_name        = "${aws_db_subnet_group.default.id}"
    engine                      = var.DB_ENGINE
    engine_version              = var.DB_ENGINE_VERSION
    instance_class              = var.DB_INSTANCE_CLASS
    name                        = var.DB_NAME
    password                    = var.DB_PASSWORD
    username                    = var.DB_USERNAME
    port                        = var.DB_PORT
    multi_az                    = false
    publicly_accessible         = true
    storage_encrypted           = true
    vpc_security_group_ids      = [data.aws_security_group.default_security_group.id]
    skip_final_snapshot         = true 
}
