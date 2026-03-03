variable "aws_region" {
  description = "AWS region"
  type        = string
}

# VPC variables
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
}

# S3 Backend variables
variable "s3_bucket_name" {
  description = "Name of S3 bucket for Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Name of DynamoDB table for state locking"
  type        = string
}

# ECR variables
variable "ecr_repository_name" {
  description = "Name of ECR repository"
  type        = string
}

# ECS variables
variable "ecs_cluster_name" {
  description = "Name of ECS cluster"
  type        = string
}

variable "ecs_service_name" {
  description = "Name of ECS service"
  type        = string
}

variable "ecs_task_family" {
  description = "ECS task family name"
  type        = string
}

variable "container_name" {
  description = "Container name"
  type        = string
}

variable "container_image" {
  description = "Container image"
  type        = string
}

variable "container_port" {
  description = "Container port"
  type        = number
  default     = 80
}

variable "ecs_cpu" {
  description = "ECS task CPU"
  type        = string
  default     = "256"
}

variable "ecs_memory" {
  description = "ECS task memory"
  type        = string
  default     = "512"
}

variable "ecs_desired_count" {
  description = "Desired number of ECS tasks"
  type        = number
  default     = 1
}

# EC2 variables
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = ""
}
