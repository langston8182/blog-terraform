resource "aws_api_gateway_method" "method_get_articles" {
  authorization = "NONE"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.resource_articles.id
  rest_api_id   = aws_api_gateway_rest_api.rest_api_blog.id

  depends_on = [
    aws_api_gateway_resource.resource_articles,
    aws_api_gateway_rest_api.rest_api_blog
  ]
}

resource "aws_api_gateway_method" "method_post_articles" {
  authorization      = "NONE"
  http_method        = "POST"
  resource_id        = aws_api_gateway_resource.resource_articles.id
  rest_api_id        = aws_api_gateway_rest_api.rest_api_blog.id
  request_parameters = {
    "method.request.querystring.action" = false
  }

  depends_on = [
    aws_api_gateway_resource.resource_articles,
    aws_api_gateway_rest_api.rest_api_blog
  ]
}

resource "aws_api_gateway_method" "method_put_images" {
  #authorization      = "COGNITO_USER_POOLS"
  authorization      = "NONE"
  http_method        = "PUT"
  resource_id        = aws_api_gateway_resource.resource_images_id_article.id
  rest_api_id        = aws_api_gateway_rest_api.rest_api_blog.id
  request_parameters = {
    "method.request.header.extension" = true
    "method.request.path.idArticle"   = true
  }

  depends_on = [
    aws_api_gateway_resource.resource_images_id_article,
    aws_api_gateway_rest_api.rest_api_blog
  ]
}

resource "aws_api_gateway_method" "method_get_published" {
  #authorization      = "COGNITO_USER_POOLS"
  authorization = "NONE"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.resource_published.id
  rest_api_id   = aws_api_gateway_rest_api.rest_api_blog.id

  depends_on = [
    aws_api_gateway_resource.resource_published,
    aws_api_gateway_rest_api.rest_api_blog
  ]
}

resource "aws_api_gateway_method" "method_get_thumbnails" {
  #authorization      = "COGNITO_USER_POOLS"
  authorization      = "NONE"
  http_method        = "GET"
  resource_id        = aws_api_gateway_resource.resource_thumbnails_id_article.id
  rest_api_id        = aws_api_gateway_rest_api.rest_api_blog.id
  request_parameters = {
    "method.request.header.extension" = true
    "method.request.path.idArticle"   = true
  }

  depends_on = [
    aws_api_gateway_resource.resource_thumbnails_id_article,
    aws_api_gateway_rest_api.rest_api_blog
  ]
}

resource "aws_api_gateway_method" "method_put_thumbnails" {
  #authorization      = "COGNITO_USER_POOLS"
  authorization      = "NONE"
  http_method        = "PUT"
  resource_id        = aws_api_gateway_resource.resource_thumbnails_id_article.id
  rest_api_id        = aws_api_gateway_rest_api.rest_api_blog.id
  request_parameters = {
    "method.request.header.extension" = false
    "method.request.path.idArticle"   = true
  }

  depends_on = [
    aws_api_gateway_resource.resource_thumbnails_id_article,
    aws_api_gateway_rest_api.rest_api_blog
  ]
}

