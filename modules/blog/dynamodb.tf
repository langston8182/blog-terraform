resource "aws_dynamodb_table" "dynamodb_blog_articles" {
  billing_mode   = "PROVISIONED"
  hash_key       = "id"
  name           = var.dynamo_db_table
  read_capacity  = 5
  stream_enabled = false
  table_class    = "STANDARD"
  tags           = {}
  tags_all       = {}
  write_capacity = 5

  attribute {
    name = "id"
    type = "S"
  }

  point_in_time_recovery {
    enabled = false
  }
}
