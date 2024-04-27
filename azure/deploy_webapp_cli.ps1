param (
    [string]$rgName,
    [string]$webAppName,
    [string]$subscriptionId = '',
    [string]$slot = ''
)

if ($subscriptionId.Length -eq 0)
{
    $subscriptionId = az account show | ConvertFrom-Json | Select-Object -ExpandProperty id;
    Write-Host("Setting SubscriptionId to current CLI Id: ${subscriptionId}");
}

Write-Host("Removing existing published files");

if (Test-Path .\publish\) {
    Get-Item .\publish\ | Remove-Item -Recurse -Force
}

if (Test-Path .\publish.zip) {
    Get-Item .\publish.zip | Remove-Item -Recurse -Force
}


Write-Host("Build/Publish .NET code");

dotnet publish -c Release -o ./publish

Write-Host("Zip..");

cd .\publish
Compress-Archive -Force -Path * -DestinationPath ..\publish.zip
cd ..

Write-Host("Publish to Azure: ${rgName}/${webAppName}. Slot: ${slot}");

az webapp deploy `
        --resource-group $rgName `
        --name $webAppName `
        --src-path ./publish.zip `
        --subscription $subscriptionId `
        --slot $slot
;
