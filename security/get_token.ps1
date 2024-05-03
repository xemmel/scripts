param (
    [string]$tenant,
    [string]$clientId,
    [string]$secret,
    [string]$scope
)

$url = "https://login.microsoftonline.com/$tenant/oauth2/v2.0/token";

$body = @{
        grant_type = "client_credentials"; 
        scope = $scope; 
        client_id = $clientId; 
        client_secret = $secret; 
};

$response = Invoke-WebRequest `
    -Uri $url `
    -Method Post `
    -Body $body
;
$token = $response.Content | ConvertFrom-Json | Select-Object -ExpandProperty access_token;

$token;
$token | Set-Clipboard;