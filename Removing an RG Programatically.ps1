<# 
.Synopsis
Script to progamatically remove a resource group from an Azure subscription.
The issuer will be promted to login to the tenant then select the required subscription and resource group.

.Prerequisite
Account used to run this process must have a minimum of contributor rights to the subscription.

.Notes
Author: Damian Lynch
Date: 08 December 2017
email: damian.lynch@bluebank.io

.Version Control
08122017 - Version 0.1: Initial release
#>

# Login to your Azure tenant
Login-AzureRMAccount

# Popuate list of subscriptions available and select required subscription. Adjust session focus to the selected subscription
$SubId = (Get-AzureRmSubscription | Out-GridView -Title "Select an Azure Subscription …" -PassThru).SubscriptionId
Set-AzureRmContext -Subscriptionid $SubId

# Polpulate list of Resource Group's from the selected subscription. Select the Resource Group to be removed
$RGName = (Get-AzureRmResourceGroup | Out-GridView -Title "Select Resource Group for deletion …" -PassThru).ResourceGroupName

# Delete the selected Resource Group
$IsDelete = Remove-AzureRmResourceGroup -Name $RGName

# Write host to comfirm success of deletion 
 if($IsDelete -eq 'True')
 {
    Write-Host "*****Resource group delete successfully*****"
 }
 
 # End of script