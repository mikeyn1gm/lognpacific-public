<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Mikey Nuñez
    GitHub          : github.com/mikeyn1gm
    Date Created    : 2025-03-03
    Last Modified   : 2025-10-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-AU-000500.ps1 
#>

# Define the registry path and the key-value pair
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$regName = "MaxSize"
$regValue = 0x8000  # Hexadecimal value for 32768 (0x8000)

# Check if the registry path exists, create it if it does not
if (-not (Test-Path $regPath)) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog" -Name "Application" -Force
}

# Set the registry value
Set-ItemProperty -Path $regPath -Name $regName -Value $regValue

Write-Host "Registry key set: $regPath\$regName = $regValue"
