<#
.SYNOPSIS
    This PowerShell script turns off printing over HTTP.

.NOTES
    Author          : Mikey Nuñez
    GitHub          : github.com/mikeyn1gm
    Date Created    : 2025-10-27
    Last Modified   : 2025-10-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000110

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000110.ps1 
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"

# Ensure the key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the DWORD value
New-ItemProperty -Path $regPath -Name "DisableHTTPPrinting" -PropertyType DWord -Value 1 -Force | Out-Null

# Confirm the setting
Get-ItemProperty -Path $regPath | Select-Object DisableHTTPPrinting
