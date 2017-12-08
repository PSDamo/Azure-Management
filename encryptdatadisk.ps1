$kvName = 'PlazKV'
$rgName = 'plazRG'
$aadClientSecret = 'plazClientSecret'
$appDisplayName = 'plazEncryptApp'
$vmName = 'plazVM'

$kv = Get-AzureRmKeyVault -VaultName $kvName -ResourceGroupName $rgName
$kvUri = $kv.VaultUri
$kvRID = $kv.ResourceId

$aadApp = Get-AzureRmADApplication -DisplayName $appDisplayName
$appID = $aadApp.ApplicationId


Set-AzureRmVMDiskEncryptionExtension -ResourceGroupName $rgName -VMName $vmName -AadClientID $appID -AadClientSecret $aadClientSecret -DiskEncryptionKeyVaultUrl $kvUri -DiskEncryptionKeyVaultId $kvRID -VolumeType Data

Get-AzureRmVMDiskEncryptionStatus -VMName $vmName -ResourceGroupName $rgName