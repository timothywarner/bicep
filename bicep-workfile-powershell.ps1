# Bicep Getting Started - PowerShell
# Note: You need the Bicep CLI installed before you use PowerShell in a Bicep context

# Get signed in and situated
Connect-AzAccount -Tenant ''
Set-AzContext -SubscriptionName ''

# Help
az bicep --help

# Compile .bicep to .json
bicep build ./Bicep-templates/storage-account.bicep

# Deploy a .bicep file to Azure
New-AzResourceGroup -Name az-rg -Location eastus

New-AzResourceGroupDeployment -Name stg-acct-bicep -ResourceGroupName az-rg -TemplateFile ./Bicep-templates/storage-account.bicep -WhatIf
