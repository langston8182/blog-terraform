resource "aws_iam_role" "role_blog_recuperer_articles" {
  name                = "blog-lambda-recuperer-articles"
  assume_role_policy  = data.aws_iam_policy_document.lambda_assume_role.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
  ]
  inline_policy {
    name   = "blog-recuperer-articles"
    policy = jsonencode(
      {
        Statement = [
          {
            Action   = "dynamodb:Scan"
            Effect   = "Allow"
            Resource = aws_dynamodb_table.dynamodb_blog_articles.arn
            Sid      = "VisualEditor0"
          },
        ]
        Version = "2012-10-17"
      }
    )
  }

  depends_on = [aws_dynamodb_table.dynamodb_blog_articles]
}

resource "aws_iam_role" "role_blog_ajouter_article" {
  name                = "blog-lambda-ajouter-article"
  assume_role_policy  = data.aws_iam_policy_document.lambda_assume_role.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
  ]
  inline_policy {
    name   = "blog-ajouter-article"
    policy = jsonencode(
      {
        Statement = [
          {
            Action   = "dynamodb:PutItem"
            Effect   = "Allow"
            Resource = aws_dynamodb_table.dynamodb_blog_articles.arn
            Sid      = "VisualEditor0"
          },
        ]
        Version = "2012-10-17"
      }
    )
  }

  depends_on = [aws_dynamodb_table.dynamodb_blog_articles]
}

resource "aws_iam_role" "role_blog_recuperer_tous_articles" {
  name                = "blog-lambda-recuperer-tous-articles"
  assume_role_policy  = data.aws_iam_policy_document.lambda_assume_role.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
  ]
  inline_policy {
    name   = "blog-recuperer-tous-articles"
    policy = jsonencode(
      {
        Statement = [
          {
            Action   = "dynamodb:Scan"
            Effect   = "Allow"
            Resource = aws_dynamodb_table.dynamodb_blog_articles.arn
            Sid      = "VisualEditor0"
          },
        ]
        Version = "2012-10-17"
      }
    )
  }

  depends_on = [aws_dynamodb_table.dynamodb_blog_articles]
}

resource "aws_iam_role" "role_blog_recuperer_article" {
  name                = "blog-lambda-recuperer-article"
  assume_role_policy  = data.aws_iam_policy_document.lambda_assume_role.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
  ]
  inline_policy {
    name   = "blog-recuperer-article"
    policy = jsonencode(
      {
        Statement = [
          {
            Action   = ["dynamodb:GetItem", "dynamodb:Query"]
            Effect   = "Allow"
            Resource = aws_dynamodb_table.dynamodb_blog_articles.arn
            Sid      = "VisualEditor0"
          },
        ]
        Version = "2012-10-17"
      }
    )
  }

  depends_on = [aws_dynamodb_table.dynamodb_blog_articles]
}

resource "aws_iam_role" "role_blog_recuperer_thumbnail_s3" {
  name                = "blog-lambda-recuperer-thumbnail-s3"
  assume_role_policy  = data.aws_iam_policy_document.lambda_assume_role.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
  ]
  inline_policy {
    name   = "blog-recuperer-thumbnail-s3"
    policy = jsonencode(
      {
        Statement = [
          {
            Action   = ["s3:GetObject", "s3:ListBucket"]
            Effect   = "Allow"
            Resource = "${aws_s3_bucket.s3_blog_articles.arn}/*"
          },
        ]
        Version = "2012-10-17"
      }
    )
  }

  depends_on = [aws_s3_bucket_public_access_block.s3_public_access]
}

resource "aws_iam_role" "role_blog_emvoyer_email_newsletter" {
  name                = "blog-lambda-envoyer_email_newsletter"
  assume_role_policy  = data.aws_iam_policy_document.lambda_assume_role.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
  ]
  inline_policy {
    name   = "blog-envoyer_email_newsletter"
    policy = jsonencode(
      {
        Statement = [
          {
            Action   = ["dynamodb:Scan", "ses:SendEmail"]
            Effect   = "Allow"
            Resource = aws_ses_email_identity.ses_identity.arn
          },
        ]
        Version = "2012-10-17"
      }
    )
  }

  depends_on = [
    aws_dynamodb_table.dynamodb_blog_articles,
    aws_ses_email_identity.ses_identity]
}

resource "aws_iam_role" "role_blog_api_gateway_upload_image_s3" {
  name = "blog-api-gateway-upload-image-s3"
  assume_role_policy = data.aws_iam_policy_document.api_gateway_assume_role.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs",
  ]
  inline_policy {
    name   = "blog-upload-image-s3"
    policy = jsonencode(
      {
        Statement = [
          {
            Action   = ["s3:PutObject"]
            Effect   = "Allow"
            Resource = "${aws_s3_bucket.s3_blog_articles.arn}/*"
          },
        ]
        Version = "2012-10-17"
      }
    )
  }
}

data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "api_gateway_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }
  }
}

