provider "aws" {
      region     = "${var.region}"
      access_key = "${var.access_key}"
      secret_key = "${var.secret_key}"
}
#Step 1: Create IAM role using aws_iam_role resource. 
resource "aws_iam_role" "testRole"{
    name = var.name
    
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Action": "sts:AssumeRole",
        "Principal": {
            "Service": "lambda.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
        }
    ]
}
    EOF
    }

#Step 2: Create IAM policy using aws_iam_policy resource. In main.tf write below configuration to create a policy.

 
  
resource "aws_iam_policy" "testPolicy" {
    name        = "Tobi-Sample-Policy"
    description = "A test policy"
    
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Action": [
            "ec2:Describe*"
        ],
        "Effect": "Allow",
        "Resource": "*"
        }
    ]
}
    EOF
    }

#Step 3: Create attachment using aws_iam_role_policy_attachment resource. 
#In main.tf write below configuration to create attachment.

 
  
resource "aws_iam_role_policy_attachment" "test-attach" {
    role       = aws_iam_role.testRole.name
    policy_arn = aws_iam_policy.testPolicy.arn
    }
    