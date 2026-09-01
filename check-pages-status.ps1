param(
  [Parameter(Mandatory = $true)]
  [string]$GitHubUsername,

  [string]$RepositoryName = "fudanpower-testing-preview"
)

$ErrorActionPreference = "Stop"

$url = "https://$GitHubUsername.github.io/$RepositoryName/testing-services/"
Write-Host "Checking $url"

try {
  $response = Invoke-WebRequest -Uri $url -Method Head -MaximumRedirection 5 -TimeoutSec 20
  Write-Host "HTTP status:" $response.StatusCode
  if ($response.StatusCode -eq 200) {
    Write-Host "The preview page is reachable:"
    Write-Host $url
  } else {
    Write-Host "The page responded, but not with HTTP 200. Check GitHub Pages build status."
  }
} catch {
  Write-Host "The page is not reachable yet."
  Write-Host "If you just enabled GitHub Pages, wait 1-3 minutes and run this script again."
  Write-Host "Error:" $_.Exception.Message
}

