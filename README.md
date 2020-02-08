# Infrastructure-as-a-code

Terraform-driven IAAC template

Before using this code, please prepare the following:

- Create a project on Google Cloud. You will need the project name to run
terraform.
- Create a service account within the new project.
- Enable the following API's for the new project:
  - compute.googleapis.com
- Create a Google Storage Bucket and use the name in `provider.tf`, line 10.
