# Existing IAM role for CodeBuild / Terraform
resource "aws_iam_role" "codebuild_role" {
  name = "${var.project_name}-codebuild-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "codebuild.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

# Attach SSM full access (for session manager, etc.)
resource "aws_iam_role_policy_attachment" "codebuild_ssm_policy" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

# Attach EC2 full access (to allow EC2 creation / describe / etc.)
resource "aws_iam_role_policy_attachment" "codebuild_ec2_policy" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
