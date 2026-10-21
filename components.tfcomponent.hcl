component "app" {
  source = "./app"

  inputs = {
    region = var.region
  }

  providers = {
    aws = provider.aws.this
  }
}
