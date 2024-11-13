# Output values
output "s3_bucket_name" {
  value = aws_s3_bucket.ruchit_bucket.bucket
}

output "instance_public_ip" {
  value = aws_instance.ruchit_instance.public_ip
}

output "security_group_id" {
  value = aws_security_group.ruchit_sg.id
}