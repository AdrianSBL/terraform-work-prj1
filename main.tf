resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-123423423423"
 
  tags = {
    Name        = "Project1-class-DevOps"
    Environment = "Dev"
  }
}
