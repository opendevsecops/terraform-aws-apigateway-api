resource "aws_api_gateway_deployment" "main" {
  rest_api_id = "${var.rest_api_id}"

  stage_name        = "${var.stage_name}"
  stage_description = "${var.stage_description}"

  lifecycle {
    create_before_destroy = true
  }
}
