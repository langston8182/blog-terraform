resource "aws_api_gateway_deployment" "deployment_blog" {
  rest_api_id = aws_api_gateway_rest_api.rest_api_blog.id

  depends_on = [
    aws_api_gateway_integration.integration_get_articles,
    aws_api_gateway_integration.integration_get_published,
    aws_api_gateway_integration.integration_post_articles,
    aws_api_gateway_integration.integration_put_images,
    aws_api_gateway_integration.integration_get_thumbnails,
    aws_api_gateway_integration.integration_put_thumbnails
  ]
}