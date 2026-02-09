provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "lab" {
  bucket = var.bucket_name
  tags = {
    Project = "terraform-simple-lab"
  }
}

resource "aws_s3_bucket_public_access_block" "lab" {
  bucket                  = aws_s3_bucket.lab.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "hello" {
  bucket  = aws_s3_bucket.lab.id
  key     = "hello.txt"
  content = "Hello from Terraform 👋"
}

resource "aws_dynamodb_table" "lab" {
  name         = "${var.project_name}-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "pk"

  attribute {
    name = "pk"
    type = "S"
  }
}
