$kvName = 'plazKV'
$rgName = 'plazRG'
$aadClientSecret = 'plazClientSecret'
$vmName = 'plazVMKEK'
$kvName = 'plazKV'
$kekName = 'plazKEK'

$kek = Get-AzureKeyVaultKey -VaultName $kvName -Name $kekName 
$kekURL = $kek.key.kid

$kv = Get-AzureRmKeyVault -VaultName $kvName -ResourceGroupName $rgName
$kvUri = $kv.VaultUri
$kvRID = $kv.ResourceId

Get-AzureRmADApplication 
$appID = 'caa64b12-dd71-43f0-acdb-d3099582c428'

Set-AzureRmVMDiskEncryptionExtension -ResourceGroupName $rgName -VMName $vmName -AadClientID $appID -AadClientSecret $aadClientSecret -DiskEncryptionKeyVaultUrl $kvUri -DiskEncryptionKeyVaultId $kvRID -KeyEncryptionKeyUrl $kekURL -KeyEncryptionKeyVaultId $kvRID -VolumeType Data
