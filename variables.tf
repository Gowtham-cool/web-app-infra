# -------------------------------
# General project settings
# -------------------------------

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name for tagging and naming resources"
  type        = string
  default     = "webapp-ci-cd"
}

# -------------------------------
# Networking
# -------------------------------

variable "allowed_ssh_ip" {
  description = "Your IP address allowed to SSH into EC2"
  type        = string
  default     = "0.0.0.0/0"   # Update later to your actual IP
}

variable "vpc_id" {
  description = "Existing VPC ID if using an existing setup"
  type        = string
  default     = ""
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs if using an existing setup"
  type        = list(string)
  default     = []
}

# -------------------------------
# GitHub / CI-CD
# -------------------------------

variable "github_token" {
  description = "GitHub personal access token for CI/CD"
  type        = string
  default     = ""
}

variable "github_repo" {
  description = "GitHub repository name where application code resides"
  type        = string
  default     = "web-app-infra"
}

variable "github_owner" {
  description = "GitHub owner / username of the repo"
  type        = string
  default     = "Gowtham-cool"
}
