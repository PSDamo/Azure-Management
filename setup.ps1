$kvName = 'PlazKV'
$rgName = 'plazRG'
$location = 'East US'
$aadClientSecret = 'plazClientSecret'
$appDisplayName = 'plazEncryptApp'

New-AzureRmResourceGroup -Name $rgName -Location $location
New-AzureRmKeyVault -VaultName $kvName -ResourceGroupName $rgName -Location $location

Set-AzureRmKeyVaultAccessPolicy -VaultName $kvName -ResourceGroupName $rgName -EnabledForDiskEncryption

$aadApp = New-AzureRmADApplication -DisplayName $appDisplayName -HomePage 'http://homepageplazEncryptApp' -IdentifierUris 'http://uriplazEncryptApp' -Password $aadClientSecret

$appID = $aadApp.ApplicationId

$aadServicePrincipal = New-AzureRmADServicePrincipal -ApplicationId $appID

Set-AzureRmKeyVaultAccessPolicy -VaultName $kvName -ServicePrincipalName $appID -PermissionsToKeys all -PermissionsToSecrets all


