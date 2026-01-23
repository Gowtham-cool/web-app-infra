variable "aws_region" {}
variable "project_name" {}
variable "vpc_id" {
  default = ""
}
variable "public_subnet_ids" {
  type    = list(string)
  default = []
}
variable "github_token" {}
variable "github_repo" {}
variable "github_owner" {}
