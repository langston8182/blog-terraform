resource "aws_api_gateway_method_response" "method_response_get_articles_200" {
  http_method     = aws_api_gateway_method.method_get_articles.http_method
  resource_id     = aws_api_gateway_resource.resource_articles.id
  rest_api_id     = aws_api_gateway_rest_api.rest_api_blog.id
  status_code     = "200"
  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_method_response" "method_response_post_articles_200" {
  http_method     = aws_api_gateway_method.method_post_articles.http_method
  resource_id     = aws_api_gateway_resource.resource_articles.id
  rest_api_id     = aws_api_gateway_rest_api.rest_api_blog.id
  status_code     = "200"
  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_method_response" "method_response_put_images_200" {
  http_method     = aws_api_gateway_method.method_put_images.http_method
  resource_id     = aws_api_gateway_resource.resource_images_id_article.id
  rest_api_id     = aws_api_gateway_rest_api.rest_api_blog.id
  status_code     = "200"
  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = false
    "method.response.header.Content-Type"                = false
  }
}

resource "aws_api_gateway_method_response" "method_response_put_images_400" {
  http_method         = aws_api_gateway_method.method_put_images.http_method
  resource_id         = aws_api_gateway_resource.resource_images_id_article.id
  rest_api_id         = aws_api_gateway_rest_api.rest_api_blog.id
  status_code         = "400"
  response_models     = {}
  response_parameters = {}
}

resource "aws_api_gateway_method_response" "method_response_put_images_500" {
  http_method     = aws_api_gateway_method.method_put_images.http_method
  resource_id     = aws_api_gateway_resource.resource_images_id_article.id
  rest_api_id     = aws_api_gateway_rest_api.rest_api_blog.id
  status_code     = "500"
  response_models = {
    "application/xml" = "Error"
  }
  response_parameters = {
    "method.response.header.Content-Type" = false
  }
}

resource "aws_api_gateway_method_response" "method_response_get_published_200" {
  http_method     = aws_api_gateway_method.method_get_published.http_method
  resource_id     = aws_api_gateway_resource.resource_published.id
  rest_api_id     = aws_api_gateway_rest_api.rest_api_blog.id
  status_code     = "200"
  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {}
}

resource "aws_api_gateway_method_response" "method_response_get_thumbnails_200" {
  http_method     = aws_api_gateway_method.method_get_thumbnails.http_method
  resource_id     = aws_api_gateway_resource.resource_thumbnails_id_article.id
  rest_api_id     = aws_api_gateway_rest_api.rest_api_blog.id
  status_code     = "200"
  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_method_response" "method_response_put_thumbnails_200" {
  http_method     = aws_api_gateway_method.method_put_thumbnails.http_method
  resource_id     = aws_api_gateway_resource.resource_thumbnails_id_article.id
  rest_api_id     = aws_api_gateway_rest_api.rest_api_blog.id
  status_code     = "200"
  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = false
  }
}

resource "aws_api_gateway_method_response" "method_response_put_thumbnails_400" {
  http_method         = aws_api_gateway_method.method_put_thumbnails.http_method
  resource_id         = aws_api_gateway_resource.resource_thumbnails_id_article.id
  rest_api_id         = aws_api_gateway_rest_api.rest_api_blog.id
  status_code         = "400"
  response_models     = {}
  response_parameters = {}
}

resource "aws_api_gateway_method_response" "method_response_put_thumbnails_500" {
  http_method         = aws_api_gateway_method.method_put_thumbnails.http_method
  resource_id         = aws_api_gateway_resource.resource_thumbnails_id_article.id
  rest_api_id         = aws_api_gateway_rest_api.rest_api_blog.id
  status_code         = "500"
  response_models     = {}
  response_parameters = {}
}
