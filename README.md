## Setup
- neovim install
```bash
brew install neovim
```

- cd
```bash
cd ~/.config/nvim
```

- clone
```bash
git clone https://github.com/fs0414/neovimdot.git
```

- dir rename
```bash
mv neovimdot nvim
```

- dependence install
```bash
brew install lazygit fzf
```

- packer install
```bash
git clone https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
```

- nvim
```bash
nvim lua/plugins.lua

:PackerInstall
```
