# dotfiles

### cloning 


For cloning you use

`git clone --bare git@github.com:eddie0809/dotfiles.git $HOME/.dotfiles`

Then say

`echo "alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/
--work-tree=$HOME'" >> $HOME/.bashrc`

ousing `source ~/.bashrc`) if you haven't installed
zsh). 
#### recommended settings

`dotfiles config --local status.showUntrackedFiles no`

which hides untracked files[^untracked] from status. 

Now we are (seemingly) 
ready to checkout.

[^untracked]: since `--work-tree` is set to `$HOME`, every file in your home
directory, except for the configs, is going to be untracked. 

`dotfiles checkout`

which probably gives you some conflicts. Worry not, just rename the conflicting
files to `<conflicting file>.old`, since they will be replaced by more sensible
configs.
