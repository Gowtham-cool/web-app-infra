# AWS region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# Project name
variable "project_name" {
  description = "Name of the project / prefix for resources"
  type        = string
  default     = "web-app-infra"
}

# GitHub configuration for pipeline
variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name (application code)"
  type        = string
}

variable "github_owner" {
  description = "GitHub username or organization"
  type        = string
}

# VPC CIDR (optional if creating from scratch)
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Public subnet CIDRs (optional if creating from scratch)
variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
