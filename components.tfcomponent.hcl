component "violations" {
  source = "./violations"

  inputs = {
    region = var.region
  }

  providers = {
    aws = provider.aws.this
  }
}
