$kvName = 'PlazKV'
$kekName = 'plazKEK'

$kvKey = Add-AzureKeyVaultKey -VaultName $kvName -Name $kekName -Destination Software


