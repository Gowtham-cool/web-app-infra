# Reference existing CodePipeline IAM Role
data "aws_iam_role" "codepipeline_role" {
  name = "web-app-codepipeline-role"
}

# S3 bucket for pipeline artifacts
resource "aws_s3_bucket" "pipeline_bucket" {
  bucket = "web-app-codepipeline-artifacts"
  acl    = "private"
}

# CodePipeline
resource "aws_codepipeline" "web_app_pipeline" {
  name     = "web-app-pipeline"
  role_arn = data.aws_iam_role.codepipeline_role.arn
  artifact_store {
    location = aws_s3_bucket.pipeline_bucket.bucket
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner      = "Gowtham-cool"
        Repo       = "web-app-infra"
        Branch     = "main"
        OAuthToken = ""  # optional, can use github_token variable
      }
    }
  }

  stage {
    name = "Build"
    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.web_app_build.name
      }
    }
  }

  tags = {
    Project = "webapp-cb-cp"
  }
}
# Placeholder: Add CodeBuild + CodePipeline resources here if required
