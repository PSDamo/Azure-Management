$kvName = 'PlazKV'
$kekName = 'plazKEK'

$kek = Get-AzureKeyVaultKey -VaultName $kvName -Name $kekName 
$kek.key.kid

Backup-AzureKeyVaultKey -VaultName $kvName -Name $kekName -OutputFile "C:\Users\Gary Grudzinskas\OneDrive\Azure KV\KV Backup\kekback.blob"
Remove-AzureKeyVaultKey -VaultName $kvName -Name $kekName
Restore-AzureKeyVaultKey -VaultName $kvName -InputFile "C:\Users\Gary Grudzinskas\OneDrive\Azure KV\KV Backup\kekback.blob"  

