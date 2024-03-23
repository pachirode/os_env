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
scoop install git
scoop install fzf
scoop install pwsh
scoop install lua
scoop install Meslo-NF
scoop install miniconda3
scoop install nodejs

# nvim setting
scoop install neovim
scoop install ripgrep
scoop install mingw
scoop install coreutils

# scoop install vscode

# Set conda init
conda init powersi

# clean old nvim config
#rm -Force ~\AppData\Local\nvim
#rm -Force ~\AppData\Local\nvim-data
#git clone https://github.com/NvChad/starter $ENV:USERPROFILE\AppData\Local\nvim && nvim
