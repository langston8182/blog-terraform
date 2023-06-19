resource "aws_lambda_permission" "lambda_permission_recuperer_articles" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_blog_recuperer_articles.function_name
  principal     = "apigateway.amazonaws.com"
}

resource "aws_lambda_permission" "lambda_permission_ajouter_article" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_blog_ajouter_article.function_name
  principal     = "apigateway.amazonaws.com"
}

resource "aws_lambda_permission" "lambda_permission_recuperer_tous_articles" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_blog_recuperer_tous_articles.function_name
  principal     = "apigateway.amazonaws.com"
}

resource "aws_lambda_permission" "lambda_permission_recuperer_article" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_blog_recuperer_article.function_name
  principal     = "apigateway.amazonaws.com"
}

resource "aws_lambda_permission" "lambda_permission_recuperer_thumbnail_s3" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_blog_recuperer_thumbnail_s3.function_name
  principal     = "apigateway.amazonaws.com"
}

resource "aws_lambda_permission" "lambda_permission_envoyer_email_newsletter" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_blog_envoyer_email_newsletter.function_name
  principal     = "apigateway.amazonaws.com"
}
