resource "aws_instance" "wanderprep-web-server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "wanderprep-web-server"
  }
}
resource "aws_instance" "wanderprep-prod-server1" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "wanderprep-prod-server1"
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