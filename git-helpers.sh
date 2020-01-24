# git config --global user.name OleksiyRudenko
# git config --global user.email fake-address@gmail.com
cp ./.gitignore ~/
git config --global format.commitMessageColumns 72
git config --global core.pager cat
# git config --global push.default upstream
git config --global merge.conflictstyle diff3
git config --global color.ui true
git config --global core.excludesfile ~/.gitignore
# aliases
git config --global alias.logg "log --graph --full-history --all --color --pretty=tformat:\"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s\""
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage 'reset HEAD --'
git config --global alias.puff "pull --ff-only"
git config --global alias.purr "pull --rebase"
# next prunes local branches, collects garbage
git config --global alias.gc-all "!git remote prune origin && git reflog expire --expire=all refs/heads/master && git fsck –unreachable && git gc"
# next lists branches you worked on (most recent goes first)
git config --global alias.branch-history "for-each-ref --sort=-committerdate --count=10 --format='%(refname:short)' refs/heads/"
# Windows specific
git config --system core.longpaths true
