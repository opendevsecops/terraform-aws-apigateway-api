resource "aws_api_gateway_rest_api" "main" {
  name        = "${var.name}"
  description = "${var.description}"
}
