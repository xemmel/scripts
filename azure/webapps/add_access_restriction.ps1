param (
    [string]$webAppName,
    [string]$rgName,
    [string]$ruleName,
    [string]$ipRange,
    [string]$priority,
    [string]$action = 'Allow',
    [string]$subscriptionId = ''
)

if ($subscriptionId.Length -eq 0) {
    $subscriptionId = az account show | ConvertFrom-Json | Select-Object -ExpandProperty id;
    Write-Host("Setting SubscriptionId to current CLI Id: ${subscriptionId}");
}


az webapp config access-restriction add `
    --resource-group $rgName `
    --name $webAppName `
    --rule-name $ruleName `
    --action $action `
    --ip-address $ipRange `
    --priority $priority `
    --subscription $subscriptionId;