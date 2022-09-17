# dotfiles

## TODO
### Script
- **ANSIBLE**
- [ ] Auto install
  - [ ] `yay`
  - [ ] `zsh`
  - [ ] `oh-my-zsh`
  - [ ] `asdf`
    - [ ] `golang`
    - [ ] `rust`
    - [ ] `nodejs`
  - [ ] `tree-sitter`
  - [ ] `nvim`
  - [ ] 

### Installing
#### General
- > git clone git@github.com:rafaelbreno/dotfiles.git

### Language Server
- OCaml
  - > npm install -g ocaml-language-server

### TreeSitter
- > :TSInstall go
- > :TSInstall ocaml
- > :TSInstall ...

### Fonts
- > mkdir ~/.local/share/fonts
- > cp fonts/nerd-fonts/patched-fonts/VictorMono/Regular/complete/*.ttf ~/.local/share/fonts
- > fc-cache -f -v
- > fc-list | grep "Victor"
- Then edit the Terminal profile
