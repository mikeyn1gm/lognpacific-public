<#
.SYNOPSIS
    This PowerShell script disables IPv6 source routing to protect against spoofing.

.NOTES
    Author          : Mikey Nuñez
    GitHub          : github.com/mikeyn1gm
    Date Created    : 2025-10-27
    Last Modified   : 2025-10-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000020.ps1 
#>

# Define the registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"

# Ensure the key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the DWORD value (2 = disable source routing completely)
New-ItemProperty -Path $regPath -Name "DisableIpSourceRouting" -PropertyType DWord -Value 2 -Force | Out-Null

# Confirm the change
Get-ItemProperty -Path $regPath | Select-Object DisableIpSourceRouting
