resource "aws_api_gateway_stage" "stage_prod" {
  deployment_id = aws_api_gateway_deployment.deployment_blog.id
  rest_api_id   = aws_api_gateway_rest_api.rest_api_blog.id
  stage_name    = "prod"
  variables     = {
    "bucket" = var.s3_bucket
  }

  depends_on = [aws_api_gateway_deployment.deployment_blog]
}