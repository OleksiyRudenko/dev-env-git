#
# UPSTREAM/ORIGIN sync
# next syncs local master and origin/master with upstream/master
git config --global alias.sync-master-upstream '!git checkout master && git pull upstream master && git push origin master'
git config --global alias.sync-main-upstream '!git checkout main && git pull upstream main && git push origin main'
#
# next syncs current branch recursively with upstream and local & origin master
git config --global alias.sync-branch-upstream-merge-master '!git sync-master-upstream && git checkout - && git merge master'
git config --global alias.sync-branch-upstream-merge-main '!git sync-main-upstream && git checkout - && git merge main'
#
# ORIGIN sync
# next syncs local master and origin/master from any branch
git config --global alias.sync-master '!git checkout master && git pull origin master && git checkout -'
git config --global alias.sync-main '!git checkout main && git pull origin main && git checkout -'
#
# next rebases feature branch onto master
git config --global alias.sync-branch-rebase-master '!git rebase master'
git config --global alias.sync-branch-rebase-main '!git rebase main'
#
# next completes rebase after conflict resolution
git config --global alias.sync-branch-continue '!git add . && git rebase --continue'
