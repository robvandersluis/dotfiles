# Dotfiles Repository
Dit is mijn persoonlijke dotfiles repository. Hierin staan configuratiebestanden voor verschillende tools en editors die ik gebruik. Door gebruik te maken van symlinks kan ik eenvoudig dezelfde configuratie op meerdere machines toepassen.

## Installatie

### 1. Clone de repository

```sh
# Clone naar je home directory
cd ~
git clone git@github.com:robvandersluis/dotfiles.git .dotfiles
```

### 2. Symlinks instellen

#### macOS/Linux
Maak een symbolic link naar de configuratiemap (bijvoorbeeld voor Neovim):

```sh
ln -s ~/.dotfiles/nvim ~/.config/nvim
```

#### Windows (PowerShell)
Maak een symbolic link naar de configuratiemap:

```powershell
#New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA\nvim -Target $HOME\dotfiles\nvim
New-Item -ItemType SymbolicLink -Path $Home\.config\nvim -Target $HOME\.dotfiles\nvim

```

Of via Command Prompt (cmd):

```cmd
mklink /D %LOCALAPPDATA%\nvim %USERPROFILE%\dotfiles\nvim
```

### 3. Controleer of de symlinks correct zijn

**macOS/Linux:**
```sh
ls -l ~/.config
```

**Windows (PowerShell):**
```powershell
Get-Item $env:LOCALAPPDATA\nvim
```

Als de symlink correct is ingesteld, zal de configuratie van Neovim vanuit de dotfiles repository worden geladen.

## Aanpassen en updaten
Om wijzigingen in je dotfiles op te slaan en te synchroniseren:

```sh
cd ~/dotfiles
git add .
git commit -m "Update configuratie"
git push
```

Bij een nieuwe installatie hoef je alleen de repository te clonen en de symlinks opnieuw in te stellen.

---

🔥 **Klaar! Nu heb je overal dezelfde setup.** 🚀


