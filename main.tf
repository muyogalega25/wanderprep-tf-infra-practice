resource "aws_instance" "wanderprep-web-server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "wanderprep-web-server"
  }
}
resource "aws_instance" "wanderprep-prod-server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "wanderprep-prod-server"
  }
}
/*
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
*/