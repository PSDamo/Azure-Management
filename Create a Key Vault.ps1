<# 
This script ceates a new Azure RM Key Vault in the speicified subscription.
Version 0.01 - Initial Release
#>    

function Get-SubscirptionID {
# Log in to your Azure tenant and pull a list of available subs, based on RBAC
Login-AzureRMAccount
Get-AzureRMSubscription | Select-Object Name, SubscriptionID | Sort-Object Name | fl
}

# Focus your remote PS session on the subscription you want to deploy the Key Vault to
Set-AzureRmContext -Subscriptionid fa23015e-224c-466a-b6ab-a3eefdf1b824

# Declare variables for use throught the process
$KVName = 'PhetKVDevUKS'
$RGName = 'RG-Phet-KV-Dev-UKS'
$KeyName = 'DiskEncryptKey'
$Location = 'UK South'

# Create Key vault using paramters declared 
New-AzureRmKeyVault -VaultName $KVName -ResourceGroupName $RGName -Location $Location
# Confirm KV parameters
Get-AzureRmKeyVault -VaultName $KVName | Select-Object Vaulturi, VaultName

# Create KV key using paramters declared
$key = Add-AzureKeyVaultKey -VaultName $KVName -Name $KeyName -Destination 'Software'
# View the uri for the key type
$key.id

# Create a secret and secret value pair
$SecretValue = ConvertTo-SecureString '3xp3r!3nc301' -AsPlainText -Force
$Secret = Set-AzureKeyVaultSecret -VaultName $KVName -Name 'DiskEncrytPassword' -SecretValue $SecretValue
# View the uri for the secret
$secret.Id

# Authorize the application to access the key or secret in the vault
Set-AzureRmKeyVaultAccessPolicy -VaultName $KVName -ServicePrincipalName e4d40601-475b-43bd-ad27-66a4077e1e68 -PermissionsToKeys decrypt,sign
# Authorize that same application to read secrets in your vault
Set-AzureRmKeyVaultAccessPolicy -VaultName $KVName -ServicePrincipalName e4d40601-475b-43bd-ad27-66a4077e1e68 -PermissionsToSecrets Get