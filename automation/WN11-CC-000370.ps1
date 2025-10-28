<#
.SYNOPSIS
    This PowerShell script disables the convenience PIN option for sign-in.

.NOTES
    Author          : Mikey Nuñez
    GitHub          : github.com/mikeyn1gm
    Date Created    : 2025-10-27
    Last Modified   : 2025-10-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000370

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000370.ps1 
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"

# Ensure the key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the DWORD value to 0 (disable domain PIN logon)
New-ItemProperty -Path $regPath -Name "AllowDomainPINLogon" -PropertyType DWord -Value 0 -Force | Out-Null

# Confirm the setting
Get-ItemProperty -Path $regPath | Select-Object AllowDomainPINLogon
