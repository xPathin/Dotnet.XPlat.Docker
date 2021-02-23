#!/bin/pwsh

if([string]::IsNullOrEmpty($args[0])){
    Write-Host "No file specified!"
    exit
}

$CSR_FILE_PATH=Resolve-Path $args[0]

if(![System.IO.File]::Exists($CSR_FILE_PATH)){
    Write-Host "Path doesn't exist!"
    exit
}

$FILE_BASENAME=[io.path]::GetFileNameWithoutExtension($CSR_FILE_PATH)

Write-Host $FILE_BASENAME

$CURRENT_LOCATION=Get-Location
cd ..
openssl ca -config openssl-ca.cnf -policy signing_policy -extensions signing_req -out ./cer/$FILE_BASENAME.pem -infiles $CSR_FILE_PATH
cd $CURRENT_LOCATION.Path