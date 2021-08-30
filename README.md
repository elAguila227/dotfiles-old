# dotfiles

Dotfiles are tracked by a bare git repo.

In order to easilly add, update and commit changes there should be an alias on .bashrc:

```bash
# make sure the --git-dir is the same as the
# directory where you created the repo above.
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
```
Also, for clarity purpose, `config config --local status.showUntrackedFiles no` should be run.

## Installing

In order to install the dotfiles in a new system please run:

```bash
curl https://raw.githubusercontent.com/elAguila227/dotfiles/main/.scripts/dotfiles-install | bash
```
