provider "aws" {
      region     = "${var.region}"
      access_key = "${var.access_key}"
      secret_key = "${var.secret_key}"
}

variable "aws_s3_bucket" {
    default = "toby-tf-bucket1"
    
}
variable "named_folder" {
    default = "tobiFeb24thFolder"
}

resource "aws_s3_bucket" "b"{
    bucket = "toby-tf-bucket1"

    tags = {
        Name = "Tope bucket"
        Environment = "Dev"
    }
}


resource "aws_s3_bucket_object" "folder1" {
    bucket = "${aws_s3_bucket.b.id}"
    acl    = "private"
    key    = "Folder1/"
    source = ""
}


