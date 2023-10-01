resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket_website_configuration.static_site_bucket.website_endpoint
    origin_id   = "S3-.${local.complete_domain}"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  aliases = ["${local.complete_domain}"]
  # aliases = ["${local.complete_domain}", "www.${local.complete_domain}"]

  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 404
    response_code         = 200
    response_page_path    = "/404.html"
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-.${local.complete_domain}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 300
    max_ttl                = 600  # Reduce this once testing is complete. Keep an Eye on Cost!
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate_validation.cert_validation.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }
}



# # # # # # # # # # # # # # ## # # # # # # # # # # 
# # Cloudfront S3 for redirect to www.           #
# # # # # # # # # # # # # # ## # # # # # # # # # # 


# resource "aws_cloudfront_distribution" "root_s3_distribution" {
#   origin {
#     # domain_name = aws_s3_bucket.root_bucket.website_endpoint
#     domain_name = aws_s3_bucket_website_configuration.static_site_bucket.website_endpoint
#     origin_id   = "S3-.${var.domain_name}"
#     custom_origin_config {
#       http_port              = 80
#       https_port             = 443
#       origin_protocol_policy = "http-only"
#       origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
#     }
#   }

#   enabled         = true
#   is_ipv6_enabled = true

#   aliases = [var.domain_name]

#   default_cache_behavior {
#     allowed_methods  = ["GET", "HEAD"]
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = "S3-.${var.domain_name}"

#     forwarded_values {
#       query_string = true

#       cookies {
#         forward = "none"
#       }

#       headers = ["Origin"]
#     }

#     viewer_protocol_policy = "allow-all"
#     min_ttl                = 0
#     default_ttl            = 86400
#     max_ttl                = 31536000
#   }

#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#     }
#   }

#   viewer_certificate {
#     acm_certificate_arn      = aws_acm_certificate_validation.cert_validation.certificate_arn
#     ssl_support_method       = "sni-only"
#     minimum_protocol_version = "TLSv1.1_2016"
#   }

#   tags = var.common_tags
# }
