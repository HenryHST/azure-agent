az group create \
    --name rg-dev-terraform-tfstate \
    --location westeurope

az storage account create \
    --name stdevterraformtfstate \
    --resource-group rg-dev-terraform-tfstate \
    --location westeurope \
    --sku Standard_LRS

az storage container create \
    --name tfstate-environments \
    --account-name stdevterraformtfstate \
    --auth-mode login