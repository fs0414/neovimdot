## Setup
1. neovim install
```bash
brew install neovim
```

2. cd
```bash
cd ~/.config/
```

3. clone
```bash
git clone https://github.com/fs0414/neovimdot.git
```

4. dir rename
```bash
mv neovimdot nvim
```

5. dependence install
```bash
brew install lazygit fzf
```

6. packer install
```bash
git clone https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
```

7. set need font
```bash
brew install --cask font-monaspace
```

```bash
brew install --cask font-hack-nerd-font
```

- Iterm2 > Setting > Profile > Text
  - Use a different font for non-ASCII text to ☑️
  - Non-ASCII Font select `Hack Nerd Font Mono`

8 cd
```bash
cd nvim
```

9. nvim
```bash
nvim lua/plugins.lua
```

10. PackerSync
```vim
:PackerInstall
```

*Hello NeoVim!*

## Note
windows
```bash
apt install neovim
```

```sh
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```
