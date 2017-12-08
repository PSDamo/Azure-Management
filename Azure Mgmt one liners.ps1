login-azurermaccount
Get-AzureRmSubscription
Set-AzureRmContext -Subscriptionid fa23015e-224c-466a-b6ab-a3eefdf1b824

Get all resource groupd in the focussed subscription sortyed by RG name:
Get-AzureRmResourceGroup | select-object ResourceGroupName, Tags | sort-object ResourceGroupName

Get resources that have a specific tag: DUBIOUS RESULTS
(Find-AzureRmResource -TagName Project -TagValue Prophet).Name

Get resource groups that have a specific tag: GOOD RESULTS
(Find-AzureRmResourceGroup -Tag @{ Project="Prophet" }).Name

To add tags to a resource group that has existing tags, retrieve the existing tags, add the new tag, and reapply the tags:
$tags = (Get-AzureRmResourceGroup -Name examplegroup).Tags
$tags += @{Status="Approved"}
Set-AzureRmResourceGroup -Tag $tags -Name examplegroup