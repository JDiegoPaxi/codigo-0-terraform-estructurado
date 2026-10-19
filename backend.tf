terraform {
  backend "s3" {
    bucket       = "tf-state-asistenciaweb"
    key          = "asistenciaweb/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
