module "blog" {
  source = "./modules/blog"
  dynamo_db_table = "blog-articles"
  s3_bucket = "blog-cmarchive-articles"
}


