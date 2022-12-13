output "s3_bucket_arn" {
  value       = aws_s3_bucket.wiaderko.*.arn
}

output "bucket_id" {
  value       = aws_s3_bucket.wiaderko.*.id
}

output "s3_bucket_bucket_domain_name" {
  value       = aws_s3_bucket.wiaderko.*.bucket_domain_name
}

output "bucket_website_endpoint" {
  value = aws_s3_bucket_website_configuration.wiaderko.*.website_endpoint
}