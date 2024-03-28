$regSystemBiosVersion = "HKLM:\HARDWARE\DESCRIPTION\System"
$regScsiBusDiskQemu = "HKLM:\HARDWARE\DEVICEMAP\Scsi\Scsi Port 0\Scsi Bus 0\Target Id 0\Logical Unit Id 0"
$regScsiBusCdQemu = "HKLM:\HARDWARE\DEVICEMAP\Scsi\Scsi Port 0\Scsi Bus 1\Target Id 0\Logical Unit Id 0"

# Spoofing the registry keys 
Set-ItemProperty -Path $regSystemBiosVersion -Name "SystemBiosVersion" -Value "Lenovo 1.21"
Set-ItemProperty -Path $regScsiBusDiskQemu -Name "Identifier" -Value "Samsung 500GB SATA"
Set-ItemProperty -Path $regScsiBusCdQemu -Name "Identifier" -Value "DVD-ROM" # In case you didn't remove the ISO file after installing
