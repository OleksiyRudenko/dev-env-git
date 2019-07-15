#
# UPSTREAM/ORIGIN sync
# next syncs local master and origin/master with upstream/master
git config --global alias.sync-master-upstream '!git checkout master && git pull upstream master && git push origin master'
#
# next syncs current branch recursively with upstream and local & origin master
git config --global alias.sync-branch-upstream-merge '!git sync-master-upstream && git checkout - && git merge master'
#
# ORIGIN sync
# next syncs local master and origin/master from any branch
git config --global alias.sync-master '!git checkout master && git pull origin master && git checkout -'
#
# next rebases feature branch onto master
git config --global alias.sync-branch-rebase '!git rebase master'
#
# next completes rebase after conflict resolution
git config --global alias.sync-branch-continue '!git add . && git rebase --continue'
