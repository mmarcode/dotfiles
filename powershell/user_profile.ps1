# Prompt
Import-Module posh-git
# Import-Module oh-my-posh
# Set-PoshPrompt zash

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
$ENV:STARSHIP_DISTRO = "者  code"
Invoke-Expression (&starship init powershell)

# Load prompt config
# function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
# $PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'marco.omp.json'
# oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# Icons
Import-Module -Name Terminal-Icons

# PSReadline
Set-PSReadlineOption -EditMode Emacs
Set-PSReadlineOption -BellStyle None
Set-PSReadlineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadlineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChrodReverseHistory 'Ctrl+r'

# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command){
 Get-Command -Name $command -ErrorAction SilentlyContinue | 
  Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
