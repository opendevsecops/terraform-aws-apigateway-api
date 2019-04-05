resource "aws_api_gateway_resource" "main" {
  rest_api_id = "${var.rest_api_id}"
  parent_id   = "${var.parent_id}"
  path_part   = "${var.parent_part}"
}

module "cors" {
  source = "../cors"

  api_id          = "${var.rest_api_id}"
  api_resource_id = "${aws_api_gateway_resource.main.id}"
}

module "any" {
  source = "../method"

  should_create = "${var.any_request_template == "" ? false : true}"

  api_id          = "${var.rest_api_id}"
  api_resource_id = "${aws_api_gateway_resource.main.id}"

  method        = "ANY"
  lambda        = "${var.any_lambda}"
  authorization = "${var.any_authorization}"

  request_template = "${var.any_request_template}"
}

module "get" {
  source = "../method"

  should_create = "${var.get_request_template == "" ? false : true}"

  api_id          = "${var.rest_api_id}"
  api_resource_id = "${aws_api_gateway_resource.main.id}"

  method        = "GET"
  lambda        = "${var.get_lambda}"
  authorization = "${var.get_authorization}"

  request_template = "${var.get_request_template}"
}

module "post" {
  source = "../method"

  should_create = "${var.post_request_template == "" ? false : true}"

  api_id          = "${var.rest_api_id}"
  api_resource_id = "${aws_api_gateway_resource.main.id}"

  method        = "POST"
  lambda        = "${var.post_lambda}"
  authorization = "${var.post_authorization}"

  request_template = "${var.post_request_template}"
}

module "patch" {
  source = "../method"

  should_create = "${var.patch_request_template == "" ? false : true}"

  api_id          = "${var.rest_api_id}"
  api_resource_id = "${aws_api_gateway_resource.main.id}"

  method        = "PATCH"
  lambda        = "${var.patch_lambda}"
  authorization = "${var.patch_authorization}"

  request_template = "${var.patch_request_template}"
}

module "put" {
  source = "../method"

  should_create = "${var.put_request_template == "" ? false : true}"

  api_id          = "${var.rest_api_id}"
  api_resource_id = "${aws_api_gateway_resource.main.id}"

  method        = "PUT"
  lambda        = "${var.put_lambda}"
  authorization = "${var.put_authorization}"

  request_template = "${var.put_request_template}"
}

module "delete" {
  source = "../method"

  should_create = "${var.delete_request_template == "" ? false : true}"

  api_id          = "${var.rest_api_id}"
  api_resource_id = "${aws_api_gateway_resource.main.id}"

  method        = "DELETE"
  lambda        = "${var.delete_lambda}"
  authorization = "${var.delete_authorization}"

  request_template = "${var.delete_request_template}"
}
