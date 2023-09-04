## Purpose

Since `create-react-app` is no longer supported I am porting Stemgarden.org's static homepage into a React app with a Vite build system and development server. Concurrently, I am seeking to automate the build and deploy process and to get the infrastructure required all managed with a Terraform module. 

## Goals

1. Create GitHub repo using Terraform and the required secrets and variables for the following steps. 
1. Create module that can spin up infrastructure for an S3 static site, CloudFront distribuion, and Route53 custom domain with DNS validated Certificate. 
1. Create workflow to run a `vite build` on each push to main.
1. Create a workflow to deploy the site by pushing the `/dist` folder to S3. 

