##########################
# IAM Roles for CI/CD
##########################

# Reference existing CodeBuild IAM Role
data "aws_iam_role" "codebuild_role" {
  name = "web-app-codebuild-role"
}

# Reference existing CodePipeline IAM Role
data "aws_iam_role" "codepipeline_role" {
  name = "web-app-codepipeline-role"
}

# Optional: attach additional inline policy to CodeBuild if required
# resource "aws_iam_role_policy" "codebuild_additional_policy" {
#   name = "codebuild-additional-policy"
#   role = data.aws_iam_role.codebuild_role.id
# 
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect   = "Allow"
#         Action   = [
#           "s3:GetObject",
#           "s3:PutObject",
#           "s3:ListBucket"
#         ]
#         Resource = "*"
#       }
#     ]
#   })
# }
