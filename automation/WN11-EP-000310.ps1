<#
.SYNOPSIS
    This PowerShell script enables Kernel DMA Protection.

.NOTES
    Author          : Mikey Nuñez
    GitHub          : github.com/mikeyn1gm
    Date Created    : 2025-10-27
    Last Modified   : 2025-10-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-EP-000310

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-EP-000310.ps1 
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection"

# Ensure the registry key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the DWORD value (0 = Disable device enumeration)
New-ItemProperty -Path $regPath -Name "DeviceEnumerationPolicy" -PropertyType DWord -Value 0 -Force | Out-Null

# Confirm the change
Get-ItemProperty -Path $regPath | Select-Object DeviceEnumerationPolicy
