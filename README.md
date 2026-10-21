# techxchange-stack-demo

Terraform Stack with one component containing intentionally non-compliant resources (unapproved EC2 instance type, unencrypted EBS volume, unencrypted RDS instance). Use it to show Terraform Policy evaluating against a Stack deployment.

The deployment reuses the AWS OIDC role from the other stack demos. Update `role_arn` in `deployments.tfdeploy.hcl` if your role's trust policy is scoped to a different organization, project or stack.
