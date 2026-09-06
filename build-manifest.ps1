param(
    [string]$Version = "1.0.0",
    [string]$DatabaseUrl = "https://raw.githubusercontent.com/SIPCI-TECHNOLOGIES/AEGIS-Signatures/main/hash-database.json"
)

$database = Join-Path $PSScriptRoot "hash-database.json"
$manifest = Join-Path $PSScriptRoot "manifest.json"

if (!(Test-Path $database)) { throw "No existe hash-database.json" }

$sha256 = (Get-FileHash -Algorithm SHA256 $database).Hash.ToLowerInvariant()
$data = Get-Content $database -Raw | ConvertFrom-Json
$count = @($data).Count

[ordered]@{
    Version = $Version
    PublishedUtc = (Get-Date).ToUniversalTime().ToString("o")
    DatabaseUrl = $DatabaseUrl
    SHA256 = $sha256
    SignatureCount = $count
} | ConvertTo-Json | Set-Content $manifest -Encoding UTF8

Write-Host "Manifest generado: $manifest"
Write-Host "SHA-256: $sha256"
Write-Host "Firmas: $count"
