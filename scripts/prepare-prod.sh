az group create \
    --name rg-prod-terraform-tfstate \
    --location westeurope

az storage account create \
    --name stprodterraformtfstate \
    --resource-group rg-prod-terraform-tfstate \
    --location westeurope \
    --sku Standard_LRS

az storage container create \
    --name tfstate-environments \
    --account-name stprodterraformtfstate \
    --auth-mode login