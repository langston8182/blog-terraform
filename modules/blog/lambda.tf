resource "aws_lambda_function" "lambda_blog_recuperer_articles" {
  function_name = "blog-recuperer-articles"
  role          = aws_iam_role.role_blog_recuperer_articles.arn
  filename      = "${path.module}/lambda/recuperer-articles.js.zip"
  handler       = "recuperer-articles.handler"
  package_type  = "Zip"
  source_code_hash = data.archive_file.zip_lambdas["recuperer-articles.js"].output_base64sha256
  runtime       = "nodejs14.x"
  environment {
    variables = {
      "TABLE" = var.dynamo_db_table
    }
  }
}

resource "aws_lambda_function" "lambda_blog_ajouter_article" {
  function_name = "blog-ajouter-article"
  role          = aws_iam_role.role_blog_ajouter_article.arn
  filename      = "${path.module}/lambda/ajouter-article.js.zip"
  handler       = "ajouter-article.handler"
  package_type  = "Zip"
  source_code_hash = data.archive_file.zip_lambdas["ajouter-article.js"].output_base64sha256
  runtime       = "nodejs14.x"
  environment {
    variables = {
      "TABLE" = var.dynamo_db_table
    }
  }
}

resource "aws_lambda_function" "lambda_blog_recuperer_tous_articles" {
  function_name = "blog-recuperer-tous-articles"
  role          = aws_iam_role.role_blog_recuperer_tous_articles.arn
  filename      = "${path.module}/lambda/recuperer-tous-articles.js.zip"
  handler       = "recuperer-tous-articles.handler"
  package_type  = "Zip"
  source_code_hash = data.archive_file.zip_lambdas["recuperer-tous-articles.js"].output_base64sha256
  runtime       = "nodejs14.x"
  environment {
    variables = {
      "TABLE" = var.dynamo_db_table
    }
  }
}

resource "aws_lambda_function" "lambda_blog_recuperer_article" {
  function_name = "blog-recuperer-article"
  role          = aws_iam_role.role_blog_recuperer_article.arn
  filename      = "${path.module}/lambda/recuperer-article.js.zip"
  handler       = "recuperer-article.handler"
  package_type  = "Zip"
  source_code_hash = data.archive_file.zip_lambdas["recuperer-article.js"].output_base64sha256
  runtime       = "nodejs14.x"
  environment {
    variables = {
      "TABLE" = var.dynamo_db_table
    }
  }
}

resource "aws_lambda_function" "lambda_blog_recuperer_thumbnail_s3" {
  function_name = "blog-recuperer-thumbnail-s3"
  role          = aws_iam_role.role_blog_recuperer_thumbnail_s3.arn
  filename      = "${path.module}/lambda/recuperer-thumbnail-s3.js.zip"
  handler       = "recuperer-thumbnail-s3.handler"
  package_type  = "Zip"
  source_code_hash = data.archive_file.zip_lambdas["recuperer-thumbnail-s3.js"].output_base64sha256
  runtime       = "nodejs14.x"
  environment {
    variables = {
      "BUCKET" = var.s3_bucket
    }
  }
}

resource "aws_lambda_function" "lambda_blog_envoyer_email_newsletter" {
  function_name = "blog-envoyer-email-newsletter"
  role          = aws_iam_role.role_blog_emvoyer_email_newsletter.arn
  filename      = "${path.module}/lambda/envoyer-email-newsletter.js.zip"
  handler       = "envoyer-email-newsletter.handler"
  package_type  = "Zip"
  source_code_hash = data.archive_file.zip_lambdas["envoyer-email-newsletter.js"].output_base64sha256
  runtime       = "nodejs14.x"
}
