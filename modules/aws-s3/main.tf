/*
1. Create an s3 bucket

2. acl

3. block public access block

4. aws s3 bucket policy

*/


resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.env_tag
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = var.acl
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls   = var.block_public_acls
  block_public_policy = var.block_public_policy
}
