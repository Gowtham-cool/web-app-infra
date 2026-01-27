data "aws_iam_role" "codebuild_role" {
  name = "web-app-codebuild-role"
}
resource "aws_iam_role_policy" "codebuild_policy" {
  name = "codebuild-policy"
  role = data.aws_iam_role.codebuild_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeSecurityGroups"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action   = "logs:*"
        Resource = "*"
      }
    ]
  })
}
resource "aws_iam_role" "codepipeline_role" {
  name = "web-app-codepipeline-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "codepipeline.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}
resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "codepipeline-policy"
  role = aws_iam_role.codepipeline_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "codebuild:BatchGetBuilds",
          "codebuild:StartBuild",
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket",
          "cloudwatch:PutMetricData"
        ]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = "logs:*"
        Resource = "*"
      }
    ]
  })
}
