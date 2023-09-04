## Purpose

Since `create-react-app` is no longer supported I am porting Stemgarden.org's static homepage into a React app with a Vite build system and development server. Concurrently, I am seeking to automate the build and deploy process and to get the infrastructure required all managed with a Terraform module. 

## Goals

1. Create GitHub repo using Terraform and the required secrets and variables for the following steps. 
1. Create module that can spin up infrastructure for an S3 static site, CloudFront distribuion, and Route53 custom domain with DNS validated Certificate. 
1. Create workflow to run a `vite build` on each push to main.
1. Create a workflow to deploy the site by pushing the `/dist` folder to S3. 

## Reusability 

This is a sandbox project and I will not go too far with it but I want to get far enough that I am confident everything will work as desired before putting too much energy into rewriting frontend code. 
The source code for the react app that will reside in the `react-with-vite-test` repo will not be reused but will be modified a bit to ensure that `react-router` and `material-ui` can still be used as they were in the old version of the stemgarden.org static site. 

I do not plan to create a reusable module for managing a GitHub repo and its secrets at this time but I do intend to immitate that code by copy/pasting from this directory to `workspaces/stem-garden/*`. Once those repos are created using the `project-with-workspaces` module the