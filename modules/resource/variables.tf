variable "rest_api_id" {}

variable "parent_id" {}

variable "parent_part" {}

variable "any_lambda" {
  default = ""
}

variable "any_authorization" {
  default = "NONE"
}

variable "any_request_validator_id" {
  type    = "string"
  default = ""
}

variable "any_request_model" {
  type    = "string"
  default = "Empty"
}

variable "any_request_template" {
  default = ""
}

variable "any_binary" {
  default = false
}

variable "any_response_content_type" {
  default = "application/json"
}

variable "get_lambda" {
  default = ""
}

variable "get_authorization" {
  default = "NONE"
}

variable "get_request_validator_id" {
  type    = "string"
  default = ""
}

variable "get_request_model" {
  type    = "string"
  default = "Empty"
}

variable "get_request_template" {
  default = ""
}

variable "get_binary" {
  default = false
}

variable "get_response_content_type" {
  default = "application/json"
}

variable "post_lambda" {
  default = ""
}

variable "post_authorization" {
  default = "NONE"
}

variable "post_request_validator_id" {
  type    = "string"
  default = ""
}

variable "post_request_model" {
  type    = "string"
  default = "Empty"
}

variable "post_binary" {
  default = false
}

variable "post_request_template" {
  default = ""
}

variable "post_response_content_type" {
  default = "application/json"
}

variable "patch_lambda" {
  default = ""
}

variable "patch_authorization" {
  default = "NONE"
}

variable "patch_request_validator_id" {
  type    = "string"
  default = ""
}

variable "patch_request_model" {
  type    = "string"
  default = "Empty"
}

variable "patch_request_template" {
  default = ""
}

variable "patch_binary" {
  default = false
}

variable "patch_response_content_type" {
  default = "application/json"
}

variable "put_lambda" {
  default = ""
}

variable "put_authorization" {
  default = "NONE"
}

variable "put_request_validator_id" {
  type    = "string"
  default = ""
}

variable "put_request_model" {
  type    = "string"
  default = "Empty"
}

variable "put_request_template" {
  default = ""
}

variable "put_binary" {
  default = false
}

variable "put_response_content_type" {
  default = "application/json"
}

variable "delete_lambda" {
  default = ""
}

variable "delete_authorization" {
  default = "NONE"
}

variable "delete_request_validator_id" {
  type    = "string"
  default = ""
}

variable "delete_request_model" {
  type    = "string"
  default = "Empty"
}

variable "delete_request_template" {
  default = ""
}

variable "delete_binary" {
  default = false
}

variable "delete_response_content_type" {
  default = "application/json"
}
