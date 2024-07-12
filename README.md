# dotfiles
### cloning
For cloning you use

`git clone --bare git@github.com:jonscheunemann/dotfiles.git $HOME/.dotfiles`

Then say

`echo "alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc`

and the ofc `source .bashrc` or restart shell.

#### recommended settings

`dotfiles config --local status.showUntrackedFiles no`

which hides untracked files [^untracked] from status.

Now we are (seemingly)ready to checkout.

[^untracked]: since `--work-tree` is set to `$HOME`, every file in your homedirectory, except for the configs, is going to be untracked.

`dotfiles checkout`
which probably gives you some conflicts. 

Worry not, just rename the conflictingfiles to `<conflicting file>.old`, since they will be replaced by more sensibleconfigs.


(Inspired by https://www.atlassian.com/git/tutorials/dotfiles, github.com/eddie0809)
