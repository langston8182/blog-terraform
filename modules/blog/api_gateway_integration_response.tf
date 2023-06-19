resource "aws_api_gateway_integration_response" "integration_response_put_images_200" {
  http_method         = aws_api_gateway_method.method_put_images.http_method
  resource_id         = aws_api_gateway_resource.resource_images_id_article.id
  rest_api_id         = aws_api_gateway_rest_api.rest_api_blog.id
  status_code         = "200"
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
    "method.response.header.Content-Type"                = "'application/json'"
  }
  response_templates = {
    "application/json" = <<EOF
            #set($bucket = $stageVariables.bucket)
            #set($nomImage = $context.requestId)
            #set($extension = $method.request.header.extension)
            #set($idArticle = $method.request.path.idArticle)
            {
            "bucket" : "$bucket",
            "nomImage": "$nomImage",
            "extension": "$extension",
            "idArticle": "$idArticle",
            "url": "https://s3.eu-west-3.amazonaws.com/$bucket/$idArticle/$nomImage.$extension"
            }
        EOF
  }

  depends_on = [
    aws_api_gateway_stage.stage_prod,
    aws_api_gateway_method.method_put_images
  ]
}

resource "aws_api_gateway_integration_response" "integration_response_put_images_400" {
  http_method         = aws_api_gateway_method.method_put_images.http_method
  resource_id         = aws_api_gateway_resource.resource_images_id_article.id
  rest_api_id         = aws_api_gateway_rest_api.rest_api_blog.id
  status_code         = "400"
  response_parameters = {}
  response_templates  = {}
  selection_pattern   = "4\\d{2}"

  depends_on = [
    aws_api_gateway_stage.stage_prod,
    aws_api_gateway_method.method_put_images
  ]
}

resource "aws_api_gateway_integration_response" "integration_response_put_images_500" {
  http_method         = aws_api_gateway_method.method_put_images.http_method
  resource_id         = aws_api_gateway_resource.resource_images_id_article.id
  rest_api_id         = aws_api_gateway_rest_api.rest_api_blog.id
  status_code         = "500"
  response_parameters = {}
  response_templates  = {
    "application/xml" = <<EOF
            #set($inputRoot = $input.json('$'))
            #if($inputRoot.contains("<Error>"))
                $inputRoot
            #end
        EOF
  }
  selection_pattern = "3\\d{2}"

  depends_on = [
    aws_api_gateway_stage.stage_prod,
    aws_api_gateway_method.method_put_images
  ]
}

resource "aws_api_gateway_integration_response" "integration_response_put_thumbnails_200" {
  http_method         = aws_api_gateway_method.method_put_thumbnails.http_method
  resource_id         = aws_api_gateway_resource.resource_thumbnails_id_article.id
  rest_api_id         = aws_api_gateway_rest_api.rest_api_blog.id
  status_code         = "200"
  response_parameters = {}
  response_templates  = {
    "application/json" = jsonencode(
      {
        body = "Photo d'article ajouté avec succès."
      }
    )
  }

  depends_on = [
    aws_api_gateway_stage.stage_prod,
    aws_api_gateway_method.method_put_thumbnails
  ]
}

resource "aws_api_gateway_integration_response" "integration_response_put_thumbnails_400" {
  http_method         = aws_api_gateway_method.method_put_thumbnails.http_method
  resource_id         = aws_api_gateway_resource.resource_thumbnails_id_article.id
  rest_api_id         = aws_api_gateway_rest_api.rest_api_blog.id
  status_code         = "400"
  response_parameters = {}
  response_templates  = {}
  selection_pattern   = "4\\d{2}"

  depends_on = [
    aws_api_gateway_stage.stage_prod,
    aws_api_gateway_method.method_put_thumbnails
  ]
}

resource "aws_api_gateway_integration_response" "integration_response_put_thumbnails_500" {
  http_method         = aws_api_gateway_method.method_put_thumbnails.http_method
  resource_id         = aws_api_gateway_resource.resource_thumbnails_id_article.id
  rest_api_id         = aws_api_gateway_rest_api.rest_api_blog.id
  status_code         = "500"
  response_parameters = {}
  response_templates  = {}
  selection_pattern   = "5\\d{2}"

  depends_on = [
    aws_api_gateway_stage.stage_prod,
    aws_api_gateway_method.method_put_thumbnails
  ]
}
