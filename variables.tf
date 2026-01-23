# AWS Region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# Project name
variable "project_name" {
  description = "Project name used for naming resources"
  type        = string
  default     = "web-app-infra"
}

# Allowed IP for SSH
variable "allowed_ssh_ip" {
  description = "Your IP address allowed to SSH into EC2"
  type        = string
  default     = "YOUR_IP/32"   # Replace with your actual IP
}

# VPC ID (if using existing VPC, else leave empty)
variable "vpc_id" {
  description = "Existing VPC ID (leave empty if creating new VPC)"
  type        = string
  default     = ""
}

# Public subnet IDs (if using existing subnets, else leave empty)
variable "public_subnet_ids" {
  description = "List of public subnet IDs (leave empty if creating new)"
  type        = list(string)
  default     = []
}

# GitHub token for CodePipeline access
variable "github_token" {
  description = "GitHub Personal Access Token with repo permissions"
  type        = string
  default     = ""
}

# GitHub repo name for the application
variable "github_repo" {
  description = "GitHub repository name for the application"
  type        = string
  default     = "web-app"
}

# GitHub owner (username or organization)
variable "github_owner" {
  description = "GitHub owner (username or organization)"
  type        = string
  default     = "Gowtham-cool"
}

# EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# AMI for EC2
variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0f5ee92e2d63afc18"  # Amazon Linux 2
}
