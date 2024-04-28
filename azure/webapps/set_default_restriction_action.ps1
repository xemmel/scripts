param (
    [string]$rgName,
    [string]$webAppName,
    [string]$subscriptionId = '',
    [string]$action,
    [string]$scmUseMain = 'true',
    [string]$slot = ''
)

if ($subscriptionId.Length -eq 0) {
    $subscriptionId = az account show | ConvertFrom-Json | Select-Object -ExpandProperty id;
    Write-Host("Setting SubscriptionId to current CLI Id: ${subscriptionId}");
}

az resource update `
    --resource-group $rgName `
    --name $webAppName `
    --resource-type "Microsoft.Web/sites" `
    --set properties.siteConfig.ipSecurityRestrictionsDefaultAction=$action
;

az resource update `
    --resource-group $rgName `
    --name $webAppName `
    --resource-type "Microsoft.Web/sites" `
    --set properties.siteConfig.scmIpSecurityRestrictionsDefaultAction=$action
;

az resource update `
    --resource-group $rgName `
    --name $webAppName `
    --resource-type "Microsoft.Web/sites" `
    --set properties.siteConfig.scmIpSecurityRestrictionsUseMain=$scmUseMain
;


