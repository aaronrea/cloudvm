terraform {
  backend "gcs" {
    bucket = "18b7fcfcd399"
    prefix = "terraform/state/arch1.tfstate"
  }
}
