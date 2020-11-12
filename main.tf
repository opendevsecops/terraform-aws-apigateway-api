resource "aws_api_gateway_rest_api" "main" {
  name        = var.name
  description = var.description
}

locals {
  response_map = {
    ACCESS_DENIED                  = 403
    API_CONFIGURATION_ERROR        = 500
    AUTHORIZER_CONFIGURATION_ERROR = 500
    AUTHORIZER_FAILURE             = 500
    BAD_REQUEST_PARAMETERS         = 400
    BAD_REQUEST_BODY               = 400
    DEFAULT_4XX                    = null
    DEFAULT_5XX                    = null
    EXPIRED_TOKEN                  = 403
    INTEGRATION_FAILURE            = 504
    INTEGRATION_TIMEOUT            = 504
    INVALID_API_KEY                = 403
    INVALID_SIGNATURE              = 403
    MISSING_AUTHENTICATION_TOKEN   = 403
    QUOTA_EXCEEDED                 = 429
    REQUEST_TOO_LARGE              = 413
    RESOURCE_NOT_FOUND             = 404
    THROTTLED                      = 429
    UNAUTHORIZED                   = 401
    UNSUPPORTED_MEDIA_TYPE         = 415
    WAF_FILTERED                   = 403
  }
}

resource "aws_api_gateway_gateway_response" "response" {
  for_each = local.response_map

  rest_api_id   = aws_api_gateway_rest_api.main.id
  response_type = each.key
  status_code   = each.value

  response_templates = {
    "application/json" = "{\"message\": $context.error.messageString}"
  }

  response_parameters = {
    "gatewayresponse.header.Access-Control-Allow-Origin" = "'*'"
    "gatewayresponse.header.Content-Type"                = "'${var.default_response_content_type}'"
  }
}
