oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons

## https://github.com/MicrosoftDocs/PowerShell-Docs/blob/main/reference/5.1/PSReadLine/Set-PSReadLineOption.md ##
##

Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionViewStyle ListView
#Set-PSReadLineOption -EditMode Windows

$env:XDG_CONFIG_HOME = "$HOME/.config"
