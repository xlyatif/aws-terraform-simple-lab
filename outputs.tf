output "bucket_name" {
  value = aws_s3_bucket.lab.bucket
}

output "object_key" {
  value = aws_s3_object.hello.key
}

output "dynamodb_table" {
  value = aws_dynamodb_table.lab.name
}
