variable "access_key" {
     description = "Access key to AWS console"
}
variable "secret_key" {
     description = "Secret key to AWS console"
}
variable "region" {
     description = "Region of AWS VPC"
}
variable "name" {
  default = "TobiRoleAttachPolicy"
  type        = string
  description = "The name of the role. "
}
variable "principal_arns" {
  default = ["arn:aws:iam::933928249780:user/cloud_user"]
  type        = list(string)
  description = "ARNs of accounts, groups, or users with the ability to assume this role."
}

variable "policy_arns" {
  default = ["arn:aws:iam::aws:policy/AdministratorAccess", "arn:aws:iam::aws:policy/AWSDirectConnectReadOnlyAccess", "arn:aws:iam::aws:policy/AmazonGlacierReadOnlyAccess"]
  type        = list(string)
  description = "List of ARNs of policies to be associated with the created IAM role"
}