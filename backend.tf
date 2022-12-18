terraform {
  backend "s3" {
    bucket = "statestreet-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
