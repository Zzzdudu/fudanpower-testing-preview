param(
  [Parameter(Mandatory = $true)]
  [string]$GitHubUsername,

  [string]$RepositoryName = "fudanpower-testing-preview",
  [string]$GitUserName = "",
  [string]$GitUserEmail = ""
)

$ErrorActionPreference = "Stop"

if ($GitHubUsername -notmatch '^[A-Za-z0-9-]+$') {
  throw "GitHubUsername can contain only letters, numbers, and hyphens."
}

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location -LiteralPath $repoRoot

$configPath = Join-Path $repoRoot "_config.yml"
$config = Get-Content -LiteralPath $configPath -Raw -Encoding UTF8
$config = $config -replace 'https://YOUR_GITHUB_USERNAME\.github\.io', "https://$GitHubUsername.github.io"
$config = $config -replace 'YOUR_GITHUB_USERNAME/fudanpower-testing-preview', "$GitHubUsername/$RepositoryName"
$config = $config -replace 'baseurl\s+: "/fudanpower-testing-preview"', "baseurl                  : `"/$RepositoryName`""
Set-Content -LiteralPath $configPath -Value $config -Encoding UTF8

if ($GitUserName) {
  git config user.name $GitUserName
} elseif (-not (git config user.name)) {
  git config user.name $GitHubUsername
}

if ($GitUserEmail) {
  git config user.email $GitUserEmail
} elseif (-not (git config user.email)) {
  git config user.email "$GitHubUsername@users.noreply.github.com"
}

git remote set-url origin "https://github.com/$GitHubUsername/$RepositoryName.git"

git add _config.yml
if (-not (git diff --cached --quiet)) {
  git commit -m "Configure preview site for $GitHubUsername"
}

git push -u origin master

Write-Host ""
Write-Host "If GitHub Pages is enabled for the repository, the preview page will be:"
Write-Host "https://$GitHubUsername.github.io/$RepositoryName/testing-services/"

