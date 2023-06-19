resource "aws_api_gateway_resource" "resource_articles" {
  parent_id   = aws_api_gateway_rest_api.rest_api_blog.root_resource_id
  path_part   = "articles"
  rest_api_id = aws_api_gateway_rest_api.rest_api_blog.id
}

resource "aws_api_gateway_resource" "resource_images" {
  parent_id   = aws_api_gateway_resource.resource_articles.id
  path_part   = "images"
  rest_api_id = aws_api_gateway_rest_api.rest_api_blog.id
}

resource "aws_api_gateway_resource" "resource_images_id_article" {
  parent_id   = aws_api_gateway_resource.resource_images.id
  path_part   = "{idArticle}"
  rest_api_id = aws_api_gateway_rest_api.rest_api_blog.id
}

resource "aws_api_gateway_resource" "resource_published" {
  parent_id   = aws_api_gateway_resource.resource_articles.id
  path_part   = "published"
  rest_api_id = aws_api_gateway_rest_api.rest_api_blog.id
}

resource "aws_api_gateway_resource" "resource_thumbnails" {
  parent_id   = aws_api_gateway_resource.resource_articles.id
  path_part   = "thumbnails"
  rest_api_id = aws_api_gateway_rest_api.rest_api_blog.id
}

resource "aws_api_gateway_resource" "resource_thumbnails_id_article" {
  parent_id   = aws_api_gateway_resource.resource_thumbnails.id
  path_part   = "{idArticle}"
  rest_api_id = aws_api_gateway_rest_api.rest_api_blog.id
}
