variable "rest_api_id" {}

variable "parent_id" {}

variable "parent_part" {}

variable "get_lambda" {
  default = ""
}

variable "get_authorization" {
  default = "NONE"
}

variable "get_request_template" {
  default = ""
}

variable "post_lambda" {
  default = ""
}

variable "post_authorization" {
  default = "NONE"
}

variable "post_request_template" {
  default = ""
}

variable "patch_lambda" {
  default = ""
}

variable "patch_authorization" {
  default = "NONE"
}

variable "patch_request_template" {
  default = ""
}

variable "put_lambda" {
  default = ""
}

variable "put_authorization" {
  default = "NONE"
}

variable "put_request_template" {
  default = ""
}

variable "delete_lambda" {
  default = ""
}

variable "delete_authorization" {
  default = "NONE"
}

variable "delete_request_template" {
  default = ""
}

# depends_on workaround

variable "depends_on" {
  description = "Helper variable to simulate depends_on for terraform modules"
  default     = []
}
