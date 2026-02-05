terraform {
  backend "gcs" {
    bucket  = "mi-terraform-githutactions"
    prefix  = "terraform/state"
  }
}
