#!/bin/pwsh

if([string]::IsNullOrEmpty($args[0])){
    Write-Host "No config file specified!"
    exit
}

$CNF_FILE_PATH=Resolve-Path $args[0]

if(![System.IO.File]::Exists($CNF_FILE_PATH)){
    Write-Host "Path doesn't exist!"
    exit
}

$CNF_FILE_BASENAME=[io.path]::GetFileNameWithoutExtension($PEM_FILE_PATH)
$CN=(Get-Content -Path "$CNF_FILE_PATH" | Where-Object { $_ -match 'commonName_default' }).Split('=')[1].Trim(' ')

if([string]::IsNullOrEmpty($CN)){
    Write-Host "CN in config file not specified!"
    exit
}

openssl req -config "$CNF_FILE_PATH" -newkey rsa:2048 -sha256 -nodes -keyout "appcert-$CN-privkey.pem" -out "appcert-$CN.csr" -outform PEM
