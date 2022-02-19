variable "bucket_name" {
  description = "The name of the bucket"
}

variable "env_tag" {
   default = "dev"
}

variable "acl" {
   default = "private"
}

variable "block_public_acls" {
   default = true
}

variable "block_public_policy" {
   default = true
}
