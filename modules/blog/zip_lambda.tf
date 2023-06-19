data "archive_file" "zip_lambdas" {
  output_path = "${path.module}/lambda/${each.value}.zip"
  type        = "zip"
  source_file = "${path.module}/lambda/${each.value}"

  for_each = fileset("${path.module}/lambda/", "*.js")
}
