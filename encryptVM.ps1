$kvName = 'PlazKV'
$rgName = 'plazRG'
$aadClientSecret = 'plazClientSecret'
$vmName = 'plazVM'

$kv = Get-AzureRmKeyVault -VaultName $kvName -ResourceGroupName $rgName
$kvUri = $kv.VaultUri
$kvRID = $kv.ResourceId

Set-AzureRmVMDiskEncryptionExtension -ResourceGroupName $rgName -VMName $vmName -AadClientID $appID -AadClientSecret $aadClientSecret -DiskEncryptionKeyVaultUrl $kvUri -DiskEncryptionKeyVaultId $kvRID

