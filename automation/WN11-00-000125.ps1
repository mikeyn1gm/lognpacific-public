<#
.SYNOPSIS
    This PowerShell script disables Windows Copilot. 
(Note: The disabled state won't be reflected within Local Group Policy Editor as that requires a manual change within the GUI. "GPEDIT’s State column doesn’t read the live registry; it reads the local policy database (%SystemRoot%\System32\GroupPolicy\User\Registry.pol for User Configuration). When you write directly to
HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot\TurnOffWindowsCopilot=1, Windows enforces the policy, but GPEDIT still says “Not configured” unless the corresponding entry also exists in Registry.pol")

.NOTES
    Author          : Mikey Nuñez
    GitHub          : github.com/mikeyn1gm
    Date Created    : 2025-10-27
    Last Modified   : 2025-10-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000125

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-00-000125.ps1 
#>

# Define registry path for User Configuration policy
$regPath = "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot"

# Ensure the key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the policy value: 1 = Enabled (Copilot turned off)
New-ItemProperty -Path $regPath -Name "TurnOffWindowsCopilot" -PropertyType DWord -Value 1 -Force | Out-Null

# Confirm
Get-ItemProperty -Path $regPath | Select-Object TurnOffWindowsCopilot
