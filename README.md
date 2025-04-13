# dotfiles

Each project that exists in the Automa project should do the following:
1. Add this REPO as a git-submodule & ensure to keep it up-to-date `git submodule add https://github.com/chaconinc/DbConnector .dotfiles`
2. In the `install:all` `package.json` script add the following:
```json
"config": "./.dotfiles/config.sh"
"install:all": "previous commands... npm run config"
```
