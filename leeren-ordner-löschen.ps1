$FolderPath = Read-Host "Bitte geben Sie den Pfad zum Ordner ein, den Sie löschen möchten."
$Confirmation = Read-Host "Sind Sie sicher, dass Sie alle leeren Ordner im Pfad $FolderPath löschen möchten? (Ja/Nein)"

if($Confirmation -eq "Ja"){
    # Löschen Sie alle leeren Ordner im angegebenen Pfad
    Get-ChildItem $FolderPath -Recurse | Where-Object { $_.PSIsContainer -and @(Get-ChildItem $_.FullName -Recurse -File).Count -eq 0 } | Remove-Item -Recurse -Force
    Write-Host "Alle leeren Ordner im Pfad $FolderPath wurden erfolgreich gelöscht."
}
else {
    Write-Host "Der Vorgang wurde abgebrochen. Keine Ordner wurden gelöscht."
}
