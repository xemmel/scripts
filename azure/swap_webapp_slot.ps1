param (
    [string]$rgName,
    [string]$webAppName,
    [string]$subscriptionId = '',
    [string]$slot = 'stage',
    [string]$targetSlot = 'production'
)

if ($subscriptionId.Length -eq 0) {
    $subscriptionId = az account show | ConvertFrom-Json | Select-Object -ExpandProperty id;
    Write-Host("Setting SubscriptionId to current CLI Id: ${subscriptionId}");
}

az webapp deployment slot swap `
    --resource-group $rgName `
    --name $webAppName `
    --slot $slot `
    --target-slot $targetSlot
;
