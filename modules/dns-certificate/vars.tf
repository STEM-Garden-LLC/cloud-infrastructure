variable "apex_domain" {
  type    = string
}

variable "subject_alternative_names" {
  type    = set(string)
  default = []
}




