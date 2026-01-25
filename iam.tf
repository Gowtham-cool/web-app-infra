# -------------------------------
# 1️⃣ CodeBuild Role
# -------------------------------
resource "aws_iam_role" "codebuild_role" {
  name = "${var.project_name}-codebuild-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "codebuild.amazonaws.com"
      },
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "codebuild_policy" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

# -------------------------------
# 2️⃣ EC2 Terraform Execution Role Policy
# -------------------------------
resource "aws_iam_policy" "terraform_ec2_policy" {
  name        = "${var.project_name}-terraform-ec2-policy"
  description = "Minimal permissions for EC2 instance to run Terraform"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          # EC2 & Networking
          "ec2:Describe*",
          "ec2:CreateSecurityGroup",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:RevokeSecurityGroupIngress",
          "ec2:RevokeSecurityGroupEgress",
          "ec2:CreateTags",
          "ec2:RunInstances",
          "ec2:TerminateInstances",
          "ec2:CreateSubnet",
          "ec2:CreateRouteTable",
          "ec2:CreateInternetGateway",
          "ec2:AttachInternetGateway",
          # ELB / ALB
          "elasticloadbalancing:*",
          # IAM pass role
          "iam:PassRole"
        ],
        Resource = "*"
      }
    ]
  })
}

# Attach the policy to the EC2 role that Terraform uses
resource "aws_iam_role_policy_attachment" "attach_terraform_policy" {
  role       = "ec2-ssm-role" # replace with your EC2 IAM role name if different
  policy_arn = aws_iam_policy.terraform_ec2_policy.arn
}
