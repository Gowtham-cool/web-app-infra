variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "project_name" {
  type        = string
  description = "Project name for tagging"
}

variable "vpc_id" {
  type        = string
  description = "Existing VPC ID"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of existing public subnet IDs"
}

variable "github_token" {
  type        = string
  description = "GitHub personal access token for CodePipeline"
}

variable "github_repo" {
  type        = string
  description = "GitHub repo name (example: web-app)"
}

variable "github_owner" {
  type        = string
  description = "GitHub owner/org name"
}
