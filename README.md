# azure-experiments
Repeatable deployments on Azure Cloud and elsewhere (eg. locally)

## Azure Cloud Shell Image
[Docker image](https://github.com/Azure/CloudShell) with all the bells and whistles for repeatable deployments

### Running container on Ubuntu 20.04

The following command starts cloudshell container and mounts current working directory in /usr/cloudshell/repo

`sudo docker run -v ${PWD}:/usr/cloudshell/repo -it mcr.microsoft.com/azure-cloudshell /bin/bash`


# Terraform

`terraform init` to install dependencies

`terraform fmt && terraform validate` to fix fomratting and validate configuration

`terraform plan` to show what is going to be changed 

`terraform apply` to apply configuration (use `-auto-approve` flag to skip confirmation prompt)

`terraform show` to inspect the current state

`terraform state list` to list resources in the state file

`terraform destroy` to destroy the stack

