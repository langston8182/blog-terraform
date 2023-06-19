resource "aws_api_gateway_integration" "integration_get_articles" {
  http_method             = aws_api_gateway_method.method_get_articles.http_method
  resource_id             = aws_api_gateway_resource.resource_articles.id
  rest_api_id             = aws_api_gateway_rest_api.rest_api_blog.id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda_blog_recuperer_articles.invoke_arn
  integration_http_method = "POST"

  depends_on = [aws_api_gateway_method.method_get_articles]
}

resource "aws_api_gateway_integration" "integration_post_articles" {
  http_method             = aws_api_gateway_method.method_post_articles.http_method
  resource_id             = aws_api_gateway_resource.resource_articles.id
  rest_api_id             = aws_api_gateway_rest_api.rest_api_blog.id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda_blog_ajouter_article.invoke_arn
  integration_http_method = "POST"

  depends_on = [aws_api_gateway_method.method_post_articles]
}

resource "aws_api_gateway_integration" "integration_put_images" {
  http_method             = aws_api_gateway_method.method_put_images.http_method
  resource_id             = aws_api_gateway_resource.resource_images_id_article.id
  rest_api_id             = aws_api_gateway_rest_api.rest_api_blog.id
  type                    = "AWS"
  passthrough_behavior    = "WHEN_NO_MATCH"
  content_handling        = "CONVERT_TO_BINARY"
  integration_http_method = "PUT"
  credentials             = aws_iam_role.role_blog_api_gateway_upload_image_s3.arn
  request_parameters      = {
    "integration.request.path.bucket"    = "stageVariables.bucket"
    "integration.request.path.extension" = "method.request.header.extension"
    "integration.request.path.idArticle" = "method.request.path.idArticle"
    "integration.request.path.objectKey" = "context.requestId"
  }
  uri = "arn:aws:apigateway:eu-west-3:s3:path/{bucket}/{idArticle}/{objectKey}.{extension}"

  depends_on = [aws_api_gateway_method.method_put_images]
}

resource "aws_api_gateway_integration" "integration_get_published" {
  http_method             = aws_api_gateway_method.method_get_published.http_method
  resource_id             = aws_api_gateway_resource.resource_published.id
  rest_api_id             = aws_api_gateway_rest_api.rest_api_blog.id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda_blog_recuperer_tous_articles.invoke_arn
  integration_http_method = "POST"

  depends_on = [aws_api_gateway_method.method_get_published]
}

resource "aws_api_gateway_integration" "integration_get_thumbnails" {
  http_method             = aws_api_gateway_method.method_get_thumbnails.http_method
  resource_id             = aws_api_gateway_resource.resource_thumbnails_id_article.id
  rest_api_id             = aws_api_gateway_rest_api.rest_api_blog.id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda_blog_recuperer_thumbnail_s3.invoke_arn
  integration_http_method = "POST"

  depends_on = [aws_api_gateway_method.method_get_thumbnails]
}

resource "aws_api_gateway_integration" "integration_put_thumbnails" {
  http_method             = aws_api_gateway_method.method_put_thumbnails.http_method
  resource_id             = aws_api_gateway_resource.resource_thumbnails_id_article.id
  rest_api_id             = aws_api_gateway_rest_api.rest_api_blog.id
  type                    = "AWS"
  passthrough_behavior    = "WHEN_NO_MATCH"
  content_handling        = "CONVERT_TO_BINARY"
  integration_http_method = "PUT"
  credentials             = aws_iam_role.role_blog_api_gateway_upload_image_s3.arn
  request_parameters      = {
    "integration.request.path.bucket"    = "stageVariables.bucket"
    "integration.request.path.extension" = "method.request.header.extension"
    "integration.request.path.dossier" = "method.request.path.idArticle"
  }
  uri = "arn:aws:apigateway:eu-west-3:s3:path/{bucket}/{dossier}/thumbnail.{extension}"

  depends_on = [aws_api_gateway_method.method_put_thumbnails]
}
