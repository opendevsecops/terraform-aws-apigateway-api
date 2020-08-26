resource "aws_api_gateway_resource" "main" {
  rest_api_id = var.rest_api_id
  parent_id   = var.parent_id
  path_part   = var.parent_part
}

module "cors" {
  source = "../cors"

  api_id          = var.rest_api_id
  api_resource_id = aws_api_gateway_resource.main.id
}

module "any" {
  source = "../method"

  count = var.any_request_template == "" ? 0 : 1

  api_id          = var.rest_api_id
  api_resource_id = aws_api_gateway_resource.main.id

  method        = "ANY"
  lambda        = var.any_lambda
  authorization = var.any_authorization

  request_validator_id = var.any_request_validator_id
  request_model        = var.any_request_model

  request_template = var.any_request_template

  binary = var.any_binary

  response_content_type = var.any_response_content_type
}

module "get" {
  source = "../method"

  count = var.get_request_template == "" ? 0 : 1

  api_id          = var.rest_api_id
  api_resource_id = aws_api_gateway_resource.main.id

  method        = "GET"
  lambda        = var.get_lambda
  authorization = var.get_authorization

  request_validator_id = var.get_request_validator_id
  request_model        = var.get_request_model

  request_template = var.get_request_template

  binary = var.get_binary

  response_content_type = var.get_response_content_type
}

module "post" {
  source = "../method"

  count = var.post_request_template == "" ? 0 : 1

  api_id          = var.rest_api_id
  api_resource_id = aws_api_gateway_resource.main.id

  method        = "POST"
  lambda        = var.post_lambda
  authorization = var.post_authorization

  request_validator_id = var.post_request_validator_id
  request_model        = var.post_request_model

  request_template = var.post_request_template

  binary = var.post_binary

  response_content_type = var.post_response_content_type
}

module "patch" {
  source = "../method"

  count = var.patch_request_template == "" ? 0 : 1

  api_id          = var.rest_api_id
  api_resource_id = aws_api_gateway_resource.main.id

  method        = "PATCH"
  lambda        = var.patch_lambda
  authorization = var.patch_authorization

  request_validator_id = var.patch_request_validator_id
  request_model        = var.patch_request_model

  request_template = var.patch_request_template

  binary = var.patch_binary

  response_content_type = var.patch_response_content_type
}

module "put" {
  source = "../method"

  count = var.put_request_template == "" ? 0 : 1

  api_id          = var.rest_api_id
  api_resource_id = aws_api_gateway_resource.main.id

  method        = "PUT"
  lambda        = var.put_lambda
  authorization = var.put_authorization

  request_validator_id = var.put_request_validator_id
  request_model        = var.put_request_model

  request_template = var.put_request_template

  binary = var.put_binary

  response_content_type = var.put_response_content_type
}

module "delete" {
  source = "../method"

  count = var.delete_request_template == "" ? 0 : 1

  api_id          = var.rest_api_id
  api_resource_id = aws_api_gateway_resource.main.id

  method        = "DELETE"
  lambda        = var.delete_lambda
  authorization = var.delete_authorization

  request_validator_id = var.delete_request_validator_id
  request_model        = var.delete_request_model

  request_template = var.delete_request_template

  binary = var.delete_binary

  response_content_type = var.delete_response_content_type
}

