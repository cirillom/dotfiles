# Invoke-RestMethod -Uri "https://raw.githubusercontent.com/cirillom/dotfiles/refs/heads/main/boostrap.ps1" | Invoke-Expression
# 1. Define base Winget arguments to suppress interactive prompts
$wingetArgs = @("--accept-package-agreements", "--accept-source-agreements", "--silent", "--source", "winget")

# 2. Allocate runtimes via Winget
winget install Git.Git @wingetArgs
winget install twpayne.chezmoi @wingetArgs
winget install Neovim.Neovim @wingetArgs
winget install Nushell.Nushell @wingetArgs
winget install marlocarlo.psmux @wingetArgs
winget install ajeetdsouza.zoxide @wingetArgs
winget install IbrahimDursun.jjui @wingetArgs

# 3. Reload environment variables into the current process memory to resolve newly installed binary paths
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# 4. Pull state and apply configurations
chezmoi init https://github.com/cirillom/dotfiles --apply
