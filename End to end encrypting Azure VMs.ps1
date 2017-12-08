<# 
First, please have the VM, Key Vault, and Azure AD (AAD) application details ready as described in Prerequisites section.
Next, you must logon to Azure and select your subscription. To logon to your subscription, launch Microsoft Azure PowerShell by searching for programs in the Windows Start menu.
Use the below cmdlet to login to your Azure account.
#>
Login-AzureRmAccount

# Once logged in, use the below cmdlet to get the list of your available subscriptions.
Get-AzureRmSubscription

# & then, select the subscription in which your resources are available.
Select-AzureRmSubscription -SubscriptionName "<your subscription name>"

# Once you have the specific subscription selected, you will need to initialize some variables with the details of resource group, key vault, VM and AAD app that will be used in subsequent cmdlets. The resource group, VM, Key Vault and the AAD app used below should have already been created as pre-requisites.
$rgName = 'MySecureRg';
$vmName = 'mysecurevm';
 
$aadClientID = <your-aad-client-id>;
$aadClientSecret = <your-aad-client-secret>;
 
$KeyVaultName = 'MySecureVault';
$KeyVault = Get-AzureRmKeyVault -VaultName $KeyVaultName -ResourceGroupName $rgname;
$diskEncryptionKeyVaultUrl = $KeyVault.VaultUri;
$KeyVaultResourceId = $KeyVault.ResourceId;