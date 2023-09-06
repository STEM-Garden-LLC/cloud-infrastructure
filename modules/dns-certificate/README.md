# DNS Certificate Module

This Module creates a DNS Certificate in Amazon ACM and validates it with Route 53.

## How to use


When the Terraform `apply` is run the certificate resource will be created but it will remain in the "pending" status and the run will not complete. To validate the certificate you must access the ACM dashbard and select the pending certificate. On its details page you will see a CNAME record name and value that you must copy to your DNS provider's records for the domain. 


Route 53 dashboard