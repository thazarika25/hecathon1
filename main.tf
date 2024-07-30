provider "aws" {
  region = "ap-south-1"
  
}
resource "aws_s3_bucket" "example_buct" {
  bucket  = "tridib-hechathon-test"
  
  tags    = {
	Name          = "myhechathonbucket"
	Environment    = "dev"
  }
}
resource "aws_s3_bucket_ownership_controls" "example_buct" {
  bucket = aws_s3_bucket.example_buct.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example_buct" {
  bucket = aws_s3_bucket.example_buct.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
