resource "aws_s3_bucket" "s3_blog_articles" {
  bucket = var.s3_bucket
}

resource "aws_s3_bucket_public_access_block" "s3_public_access" {
  bucket = aws_s3_bucket.s3_blog_articles.bucket

  block_public_acls   = false
  block_public_policy = false

  depends_on = [aws_s3_bucket.s3_blog_articles]
}