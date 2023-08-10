This will be a test work space initially as I research Terraform on behalf of Airtonomy. It may eventually become the real infrastructure as code repo for the STEM Garden LLC.

## Structure of this Repo

- Each folder in `/workspaces` corresponds to one Terraform Cloud Workspace in the organization [stem-garden-llc](https://app.terraform.io/app/stem-garden-llc/workspaces)

- Each folder in `/modules` corresponds to one STEM Garden custom infrastructure pattern that can be reused in multiple workspaces.


## Terminology

## Workspace 

Workspaces are a Terraform construct that enable the overall infrastructure to be re-provisioned in a piecewise manner. Each Workspace is linked to a subdirectory of the `/workspaces` folder which lives at the root of this repo. This linking is handled via the Terraform Cloud Workspace settings page, in the Version Control section. Within the `/workspaces` folder a flat structure is implemented and each sub-folder will be named in a way that uses abbreviations to indicate which Project and Environment is is associated with. Some workspaces will manage infrastructure that is not associated with a particular project but that is shared across the STEM Garden LLC organization. 

### Projects

There are multiple distinct client facing efforts that will run on infrastructure provisioned from this repo including Mastery Math (MM), the STEM Garden Homepage (SGHP), and the Chess Club Host Tool (CCHT). 

### Environments 

Each **project** will have multiple versions of itself deployed on infrastructure that is separated into three distinct Environments. This will enable experimental changes to the Dev Environment of each project to be reviewed and tested before being promoted to Stage and then to Prod. 

### Deployments

A deployment refers to a folder inside `/workspaces` that contains infrastructure declaration related to a particular **Project and Environment**. Not every sub-folder of `/workspaces` is a "deployment", for instance shared resources like the definition of the Organization structure has its own workspace folder but is not a deployment. Example deployments would include `SGHP-prod` and `MM-stage`.

