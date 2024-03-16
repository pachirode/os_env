$scoopDir = 'C:\scoop'

# Install scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh -outfile 'install.ps1'
.\install.ps1 -ScoopDir $scoopDir

# Install extras bucket
scoop bucket add extras
scoop bucket add nerd-fonts




# Install origin software
scoop update
scoop install neovim
scoop install git
scoop install wget
scoop install fzf
scoop install pwsh
scoop install Meslo-NF
# scoop install vscode
