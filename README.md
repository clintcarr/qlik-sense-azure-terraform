# Qlik Sense AMI deployment - AWS

## Pre-requisites
1. A Microsoft Azure account
2. An identity created in Azure Active Directory for Terraform to be able to use the Azure APIs (https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
3. Qlik Sense license

## Instructions
1. Download and install Terraform (https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_windows_amd64.zip)
2. Extract the archive and add the path to the file to your user/system path.
3. Clone this repository
4. run __terraform init__ from shell

## Variables
1. Azure Subscription ID
2. Azure Client ID (from Azure Active Directory)
3. Azure Client Secret (from Azure Active Directory)
4. Azure Tenant ID (from Azure Active Directory)
5. Resource Group Name
6. Azure Location
7. Windows user to create as Administrator
8. Windows Administrator Password (Windows requires complex passwords Upper/Lower/Special/Min Length)
9. Postgres admin password
10. Server Hostname
11. Password for repository user
12. Qlik Sense serial number
13. Qlik Sense Control number
14. Qlik Sense license name
15. Qlik Sense license 





