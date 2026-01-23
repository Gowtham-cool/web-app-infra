# web-app-infra

This repository contains Terraform code to:

- Create AWS VPC, subnets, Internet Gateway, route tables
- Create security groups
- Launch EC2 instance with NGINX
- Setup Application Load Balancer
- Create IAM roles for CodeBuild and CodePipeline
- Setup CI/CD pipeline to deploy web-app from GitHub automatically
