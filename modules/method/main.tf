data "aws_region" "current" {
}

resource "aws_api_gateway_method" "method" {
  count = var.should_create == true ? 1 : 0

  rest_api_id          = var.api_id
  resource_id          = var.api_resource_id
  http_method          = var.method
  authorization        = var.authorization
  authorizer_id        = var.authorizer_id
  authorization_scopes = var.authorization_scopes
  api_key_required     = var.api_key_required
  request_validator_id = var.request_validator_id
  request_parameters   = var.request_parameters

  request_models = {
    "application/json" = var.request_model
  }
}

resource "aws_api_gateway_integration" "integration" {
  count = var.should_create == true ? 1 : 0

  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method.method[0].http_method

  type                    = "AWS"
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  uri                     = "arn:aws:apigateway:${data.aws_region.current.name}:lambda:path/2015-03-31/functions/${var.lambda}/invocations"

  request_templates = {
    "application/json" = var.request_template
  }

  depends_on = [aws_api_gateway_method.method]
}

resource "aws_api_gateway_method_response" "S200" {
  count = var.should_create == true ? 1 : 0

  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method.method[0].http_method
  status_code = "200"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
    "method.response.header.Content-Type"                = true
  }

  response_models = {
    var.response_content_type = var.response_model
  }

  depends_on = [aws_api_gateway_method.method]
}

resource "aws_api_gateway_method_response" "S400" {
  count = var.should_create == true ? 1 : 0

  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method.method[0].http_method
  status_code = "400"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }

  response_models = {
    "application/json" = "Error"
  }

  depends_on = [aws_api_gateway_method.method]
}

resource "aws_api_gateway_method_response" "S401" {
  count = var.should_create == true ? 1 : 0

  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method.method[0].http_method
  status_code = "401"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }

  response_models = {
    "application/json" = "Error"
  }

  depends_on = [aws_api_gateway_method.method]
}

# TF-UPGRADE-TODO: In Terraform v0.11 and earlier, it was possible to begin a
# resource name with a number, but it is no longer possible in Terraform v0.12.
#
# Rename the resource and run `terraform state mv` to apply the rename in the
# state. Detailed information on the `state move` command can be found in the
# documentation online: https://www.terraform.io/docs/commands/state/mv.html
resource "aws_api_gateway_integration_response" "S200" {
  count = var.should_create == true ? 1 : 0

  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method.method[0].http_method
  status_code = aws_api_gateway_method_response.S200[0].status_code

  content_handling = var.binary ? "CONVERT_TO_BINARY" : "CONVERT_TO_TEXT"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
    "method.response.header.Content-Type"                = "'${var.response_content_type}'"
  }

  depends_on = [
    aws_api_gateway_method.method,
    aws_api_gateway_method_response.S200,
  ]
}

resource "aws_api_gateway_integration_response" "S400" {
  count = var.should_create == true ? 1 : 0

  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method.method[0].http_method
  status_code = aws_api_gateway_method_response.S400[0].status_code

  selection_pattern = "^(?![Uu]nauthorized).+"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  response_templates = {
    "application/json" = <<EOF
#set($message = $util.escapeJavaScript($input.path('$.errorMessage')))
{
  "message": "$message"
}
EOF

  }

  depends_on = [
    aws_api_gateway_method.method,
    aws_api_gateway_method_response.S400,
  ]
}

# TF-UPGRADE-TODO: In Terraform v0.11 and earlier, it was possible to begin a
# resource name with a number, but it is no longer possible in Terraform v0.12.
#
# Rename the resource and run `terraform state mv` to apply the rename in the
# state. Detailed information on the `state move` command can be found in the
# documentation online: https://www.terraform.io/docs/commands/state/mv.html
resource "aws_api_gateway_integration_response" "S401" {
  count = var.should_create == true ? 1 : 0

  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method.method[0].http_method
  status_code = aws_api_gateway_method_response.S401[0].status_code

  selection_pattern = "^[Uu]nauthorized"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  response_templates = {
    "application/json" = <<EOF
#set($message = $util.escapeJavaScript($input.path('$.errorMessage')))
{
  "message": "$message"
}
EOF

  }

  depends_on = [
    aws_api_gateway_method.method,
    aws_api_gateway_method_response.S401,
  ]
}

