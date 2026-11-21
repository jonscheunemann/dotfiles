# dotfiles
### cloning
For cloning you use

`git clone --bare git@github.com:jonscheunemann/dotfiles.git $HOME/.dotfiles`

Then say

`echo "alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc`

and the ofc `source .bashrc` or restart shell.

#### recommended settings

`dot config --local status.showUntrackedFiles no`

which hides untracked files [^untracked] from status.

Now we are (seemingly)ready to checkout.

[^untracked]: since `--work-tree` is set to `$HOME`, every file in your homedirectory, except for the configs, is going to be untracked.

`dot checkout`
which probably gives you some conflicts. 

Worry not, just rename the conflictingfiles to `<conflicting file>.old`, since they will be replaced by more sensibleconfigs.

### claude code
Skills live in their own repo; clone it once:

`git clone git@github.com:jonscheunemann/skills.git $HOME/.claude/skills`

`~/.claude-research/` (second account, alias `claude-research`) only tracks symlinks
to `~/.claude/settings.json` and `~/.claude/skills`, so both accounts share one copy.
Log in once per account with `/login`. `~/.claude/` itself is not tracked (credentials,
history, caches).


(Inspired by https://www.atlassian.com/git/tutorials/dotfiles, github.com/eddie0809)
