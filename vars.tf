variable "project" {
  type        = string
  description = "The name of your google-cloud project, e.g. 'free-micro-123456'"
}


variable "region" {
  type    = string
  default = "us-east1"
}

variable "zone" {
  type    = string
  default = "us-east1-b"
}

variable "subnetwork" {
  type    = string
  default = "e1"
}
