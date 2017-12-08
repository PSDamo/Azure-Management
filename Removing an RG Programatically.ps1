# Login to your Azure tenant
Login-AzureRMAccount

# Popuate list of subscriptions available and select required sub. Adjust session focus to selected sub
$SubId = (Get-AzureRmSubscription | Out-GridView -Title "Select an Azure Subscription …" -PassThru).SubscriptionId
Set-AzureRmContext -Subscriptionid $SubId

# Polpulate list of RG's from the selected subscription. Select the RG to be removed
$RGName = (Get-AzureRmResourceGroup | Out-GridView -Title "Select an Resource Group …" -PassThru).ResourceGroupName

# Delete the selected Resource Group
$IsDelete = Remove-AzureRmResourceGroup -Name $RGName
 
 if($IsDelete -eq 'True')
 {
    Write-Host "Resource group delete successfully"
 }
 
 # End of script