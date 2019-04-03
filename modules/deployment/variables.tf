variable "rest_api_id" {
  type = "string"
}

variable "stage_name" {
  type = "string"
}

variable "stage_description" {
  type = "string"
}

# depends_on workaround

variable "depends_on" {
  description = "Helper variable to simulate depends_on for terraform modules"
  default     = []
}
