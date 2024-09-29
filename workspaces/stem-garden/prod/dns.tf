# 1. Create subdomain Hosted Zone in Project Account
# 2. Add NS records for subdomain in existing HZ in Management Account
# 3. Create and validate and ACM SSL Certificate for the subdomain

resource "aws_route53_zone" "prod" {
  name = "www.stemgarden.org"

}

# resource "aws_route53_record" "dev-ns" {
#   zone_id = aws_route53_zone.main.zone_id
#   name    = "dev.example.com"
#   type    = "NS"
#   ttl     = "30"
#   records = aws_route53_zone.dev.name_servers
# }