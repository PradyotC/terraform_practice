output "s3_domain_url" {
  value = "http://${module.s3.s3_domain_name}/index.html"
}