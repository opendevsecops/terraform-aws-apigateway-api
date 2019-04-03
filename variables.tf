variable "name" {
  description = "The name of the REST API"
  type        = "string"
}

variable "description" {
  description = "The description of the REST API"
  type        = "string"
  default     = ""
}

# depends_on workaround

variable "depends_on" {
  description = "Helper variable to simulate depends_on for terraform modules"
  default     = []
}
