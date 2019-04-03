variable "api_id" {
  type = "string"
}

variable "api_resource_id" {
  type = "string"
}

variable "allowed_headers" {
  type = "list"

  default = [
    "Content-Type",
    "X-Amz-Date",
    "Authorization",
    "X-Api-Key",
    "X-Amz-Security-Token",
  ]
}

variable "allowed_methods" {
  type = "list"

  default = [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "PATCH",
    "DELETE",
  ]
}

variable "allowed_origin" {
  type    = "string"
  default = "*"
}

variable "allowed_max_age" {
  type    = "string"
  default = "7200"
}
