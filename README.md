# Final project for cloud

## Terraform

### Create VM:
```shell
cd terraform
az login
terraform init
terraform apply
```

## Azure App Service

### Create VM:
```shell
cd webapp
az login
az webapp up --sku B1 --name projet-final-cloud
```
