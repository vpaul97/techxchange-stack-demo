identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "development" {
  inputs = {
    region         = "us-east-1"
    role_arn       = "arn:aws:iam::060795911201:role/stacks-vpaul_test-tfpolicy-with-stacks"
    identity_token = identity_token.aws.jwt
  }
}
