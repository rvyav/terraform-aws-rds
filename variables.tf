
variable "AWS_ACCESS_KEY" {
    type = string
}

variable "AWS_SECRET_KEY" {
    type = string
}

variable "AWS_REGION" {
    type = string
}

variable "AWS_INSTANCE_AMI" {
    type = string
}

variable "AWS_INSTANCE_TYPE" {
    type = string
}

variable "AWS_CIDR_BLOCK" {
    type    = string
    default = "10.0.0.0/16"
}

variable "security_group_id" {}

variable "rds_instance_identifier" {
    type = string
    default = "terraform-postgres"
}

variable "DB_NAME" {
    type = string
}

variable "DB_PASSWORD" {
    type = string
}

variable "DB_USERNAME" {
    type = string
}

variable "DB_PORT" {
    type = string
}

variable "DB_ENGINE" {
    type = string
}

variable "DB_ENGINE_VERSION" {
    type = string
}

variable "DB_INSTANCE_CLASS" {
    type = string
}
