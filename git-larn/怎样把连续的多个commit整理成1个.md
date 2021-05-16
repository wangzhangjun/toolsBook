```
git rebase -i [要更改的commit的上一级commit]
```

```
git log --graph
* commit 7d3386842a2168ae630b65f687364243139c893c (HEAD -> master, origin/master, origin/HEAD)
| Author: aimuch <liuvay@gmail.com>
| Date:   Thu Dec 20 23:34:18 2018 +0800
|
|     update
|
* commit 9eb3188bbc63cae1bfed5f9dfc1593019e360a6a
| Author: aimuch <liuvay@gmail.com>
| Date:   Wed Dec 19 20:30:14 2018 +0800
|
|     update
|
* commit bbe6d53e2b477f2d2aa402af7f315ecdfc63459e
| Author: aimuch <liuvay@gmail.com>
| Date:   Wed Dec 19 20:12:29 2018 +0800
|
|     update
|
* commit 7735d66ded7f98adeca93d96fb7be12ffb67c76a
| Author: aimuch <liuvay@gmail.com>
| Date:   Wed Dec 19 00:27:00 2018 +0800
|
|     update
|
* commit d9f9d115fab425b5654f8ccfec6a996aef35b76b
| Author: aimuch <liuvay@gmail.com>
| Date:   Wed Dec 19 00:23:36 2018 +0800
|
|     update
```
```
pick   7735d66 update #合并到该commit上
squash bbe6d53 update
squash 9eb3188 update
squash 7d33868 update
# Rebase d9f9d11..7d33868 onto d9f9d11 (4 commands)
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup <commit> = like "squash", but discard this commit's log message
# x, exec <command> = run command (the rest of the line) using shell
# b, break = stop here (continue rebase later with 'git rebase --continue')
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
# .       create a merge commit using the original merge commit's
# .       message (or the oneline, if no original merge commit was
# .       specified). Use -c <commit> to reword the commit message.
```
