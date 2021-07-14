# Bicep Getting Started - PowerShell

# Get signed in and situated
Connect-AzAccount -Tenant ''
Set-AzContext -SubscriptionName ''

# Compile .bicep to .json (notice we need the Bicep CLI)
bicep build ./Bicep-templates/storage-account.bicep

# Deploy a .bicep file to Azure
New-AzResourceGroup -Name az-rg -Location eastus

New-AzResourceGroupDeployment -Name stg-acct-bicep -ResourceGroupName az-rg -TemplateFile ./Bicep-templates/storage-account.bicep -WhatIf
