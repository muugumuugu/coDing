# GIT & GITHUB

## basically

- GIT.
	> version control
- GITHUB.
	> collab

## terminology

- Repo
	> A project
- Commit
	> Save Staged Changes.
	> Basically save/update/delete files in the spotlight(stage).
	- hash
	- allows history browsing with notes
- Branching
	> main branch(default master)= root
	- other branches = experimentals
	- merge branches to include.
- Push
	> upload commits to remote.
- Pull Request
	> request to merge branches/ forks.
- Fork
	>create a duplicate , no change to core repo.
- Issues
	> to resolve, suggestions or bugs,ideas, sticky notes of todos
	- if u commit with a fixes #issueId, issue closed automaticalyy with that commit
- Clone
	> Download/Pull from server
- Remote
	> clone living on some server, here, GITHUB.
- Make a branch named gh-pages, and switch on the github pages for it. This hosts ur site on github.io 	>)).

## copy pasta commands
-  make present working directory a git repo
	```bash
	git init
	```
---

-  stage file to commit
	```bash
	git add filename
	```
- stage all changes
	```bash
	git add .
	```
- stage all files currently existing in location.
	```bash
	git add *
	```
- delete a file and stage it's deletion.
	```bash
	git rm fname
	```
---

-  commit the staged files with commit message.
	```bash
	git commit -m msg
	```
-  commit all changes in curr repo with msg
	```bash
	git commit -a -m "msg"
	```
---

- reset last n commits
	```bash
	git reset --soft HEAD~n
	```

---

- rename main branche
	```bash
	git branch -M localMain
	```
---

-  list remotes assosiated, and describe them
	```bash
	git remote -v
	```
-  add a link to a repo on some remote server
	```bash
	git remote add localNameForRemoteRep remoteRepoUrl
	```
-  get changes made in given branch of remote repo and update local branch with them.
	```bash
	git pull localNameForRemoteRep/branchname localbranchename
	```
- upload current repository data and status to clone on server
	```bash
	git push localNameForRemoteRep/branchname localbranchename
	```
- track changes of a remote branch
	```bash
	git push --set-upstream localNameForRemoteRep/branchname localbranchename
	```

---

- switch to another branch
	```bash
	git checkout branchname
	```
- switch to new branch
	```bash
	git checkout -b branchname
	```
---

-  check changes, branch , etc.
	```bash
	git status
	```
-  show history upto last n commits/branches in Vim, exit by 	>q
	```bash
	git log -n
	```

---

- configure
	```
	git config --global user.name "name"
	git config --global user.email "mail"
	```
