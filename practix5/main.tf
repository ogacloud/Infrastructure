resource "aws_s3_bucket" "tobiiii"{
    bucket = "toby-tf-bucket1"

    tags = {
        Name = "Tope bucket"
        Environment = "Dev"
    }
}