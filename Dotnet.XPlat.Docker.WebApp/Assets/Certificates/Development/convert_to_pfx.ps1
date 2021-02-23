#!/bin/pwsh
if([string]::IsNullOrEmpty($args[0])){
    Write-Host "No file specified!"
    exit
}

$PEM_FILE_PATH=Resolve-Path $args[0]

if(![System.IO.File]::Exists($PEM_FILE_PATH)){
    Write-Host "Path doesn't exist!"
    exit
}

$PEM_FILE_DIRECTORY=[io.path]::GetDirectoryName($PEM_FILE_PATH)
$PEM_FILE_BASENAME=[io.path]::GetFileNameWithoutExtension($PEM_FILE_PATH)
$PEM_PRIVKEY_PATH=[io.path]::Combine($PEM_FILE_DIRECTORY, "$PEM_FILE_BASENAME-privkey.pem");

openssl pkcs12 -inkey "$PEM_PRIVKEY_PATH" -in "$PEM_FILE_PATH" -export -out "$PEM_FILE_BASENAME.pfx"