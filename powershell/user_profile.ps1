# Prompt
Import-Module posh-git

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
$ENV:STARSHIP_DISTRO = "者 mmarcode "
Invoke-Expression (&starship init powershell)

# Icons
Import-Module -Name Terminal-Icons
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

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

# Git status
function gs { git status }

# Git push origin
function gpo { git push origin }

# Git diff (entre ramas o commits)
function gd { git diff $args }

# Git diff solo los cambios no indexados
function gdu { git diff }

# Git diff para ver solo los cambios ya preparados (staged)
function gds { git diff --cached }

# Git branch (listar ramas)
function gb { git branch }

# Git branch con detalles (último commit, autor, etc.)
function gbv { git branch -vv }

# Git checkout a una rama
function gco { git checkout $args }

# Git pull
function gpl { git pull }

# Git fetch
function gf { git fetch }

# Git log bonito con gráfico
function gld { git log --oneline --graph --decorate --all }

function glo { git log --oneline }

# Git commit con formato de mensaje
function gcm {
  param(
    [string]$msg1,  # Tipo de cambio - [Fix, Feat, New]
    [string]$msg2,  # Ticket         - DNC-XXXX
    [string]$msg3,  # ¿Qué se hizo?
    [string]$msg4   # ¿Por qué se hizo?
  )

  if (-not ($msg1 -and $msg2 -and $msg3 -and $msg4)) {
    Write-Host "❌ Debes proporcionar los cuatro mensajes: tipo, ticket, qué se hizo, por qué se hizo." -ForegroundColor Red
    return
  }

  # Convertir a mayúsculas
  $msg1 = $msg1.ToUpper()
  $msg2 = $msg2.ToUpper()

  $formattedMsg = @"
  [$msg1][$msg2]

  ¿Qué se hizo?
  $msg3

  ¿Por qué se hizo?
  $msg4
"@

  git commit -m "$formattedMsg"
}

# Elimina una o mas ramas locales
function gbd {
  param (
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$branches
  )

  if (-not $branches) {
    Write-Host "❌ Debes especificar al menos una rama para eliminar." -ForegroundColor Red
    return
  }

  foreach ($branch in $branches) {
    Write-Host "🗑️ Eliminando rama '$branch'..." -ForegroundColor Yellow
    git branch -D $branch
  }
}

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue | 
  Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
