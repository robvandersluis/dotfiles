# Theme & prompt
# https://ohmyposh.dev/
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons

# PSReadLine tuning
## https://github.com/MicrosoftDocs/PowerShell-Docs/blob/main/reference/5.1/PSReadLine/Set-PSReadLineOption.md ##
Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionViewStyle ListView
#Set-PSReadLineOption -EditMode Windows

# XDG-style config path for consistency across platforms
$env:XDG_CONFIG_HOME = "$HOME/.config"

# Moved to user environment variables
# To edit: Win+R → rundll32 sysdm.cpl,EditEnvironmentVariables
# $env:OPENAI_API_KEY = "sk-..."

# Aliassen (cross-platform muscle memory)
Set-Alias mc "C:\Program Files (x86)\Midnight Commander\mc.exe"
Set-Alias vim nvim
Set-Alias cat Get-Content
