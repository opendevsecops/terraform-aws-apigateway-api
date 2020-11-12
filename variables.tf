variable "name" {
  description = "The name of the REST API"
  type        = string
}

variable "description" {
  description = "The description of the REST API"
  type        = string
  default     = ""
}

variable "default_response_content_type" {
  type    = string
  default = "application/json"
}
