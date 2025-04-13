# dotfiles

Each project that exists in the Automa project should do the following:
1. Add this REPO as a git-submodule & ensure to keep it up-to-date `git submodule add https://github.com/chaconinc/DbConnector .dotfiles`
2. In the `install:all` `package.json` script add the following:
```json
"config": "./.dotfiles/config.sh"
"install:all": "previous commands... npm run config"
```

> [!NOTE]
> Any repo you clone that already has the dotfiles included clone via this command: `git clone <repo> --recursive` 

Add the following command to your package.json in order to update all the sub-modules in the repo
```json
{
  "scripts": {
    "update-submodules": "git submodule foreach --recursive 'branch=$(git remote show origin | awk \"/HEAD branch/ {print \\$NF}\"); git checkout $branch && git pull origin $branch' && git add . && git commit -m \"chore: update submodules\" || echo 'No changes to commit'"
  }
}
```
