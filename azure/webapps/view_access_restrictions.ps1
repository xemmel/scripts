param (
    [string]$webAppName,
    [string]$rgName,
    [string]$subscriptionId = ''
)

if ($subscriptionId.Length -eq 0) {
    $subscriptionId = az account show | ConvertFrom-Json | Select-Object -ExpandProperty id;
    Write-Host("Setting SubscriptionId to current CLI Id: ${subscriptionId}");
}


az webapp config access-restriction show --name $webAppName --resource-group $rgName --subscription $subscriptionId;
