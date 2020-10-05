# Basics of using git and GitHub for EP 501

This document describes some aspects of git useful for EP 501 in the simplest possible terms. We do not attempt to cover more difficult use cases or advanced features.  

## Note on git vs. GitHub

"git" is version control software that is installed by default on most computer systems.  GitHub is a website and service that provides a way to share codes under version control and has additional features like bug reporting and Project tracking.  You may also want to install GitHub desktop, which is a graphical interface for making commits and pushing changes to the remote branch (version of code) - this tutorial focuses mostly on command line use but many of the operations can also be done through the GitHub desktop GUI.  Signing up for a GitHub account can be done from the main page [https://github.com](https://github.com), and is free and takes just a few minutes.  


## Getting starting by *forking* the course repository

If you choose to use version control in this course the easiest way to do so it to first create a free account on github.com and then navigate to my course organization:  [https://github.com/Zettergren-Courses](https://github.com/Zettergren-Courses).  From there select the repository (hereafter "repo") corresponding to the language that you would like to use, for now either [MATLAB](https://github.com/Zettergren-Courses/EP501_matlab) or [Python](https://github.com/Zettergren-Courses/EP501_python).  

In the top right corner of the web page there is a button that will *fork* this repository (which is currently under the [Zettergren-Courses](https://github.com/Zettergren-Courses) organization).  The process of forking takes a few minutes to complete and creates a copy of the chosen code repo in your own online GitHub account.  This copy can be edited and altered with impunity and will not affect the copy that is housed in [Zettergren-Courses](https://github.com/Zettergren-Courses).  It is effectively you own personal online version of that repo.  Depending on your GitHub settings, this copy can be made public in case you want to share you codes with others.  By default only you will be able to make changes to your forked repository, although there are ways to allows others to contribute.  

Once you fork a code, as explained above, you will have your own copy of that repository, also under version control, on your GitHub account site.  This document refers to that copy as *your GitHub copy* of the repo while the original (belonging to my organization) that you forked is termed the *upstream* copy.  The upstream copy is protected and all changes you make will occur on your copy so you need not worry about accidentally altering the upstream (in fact git will not allow you to change the upstream at all).  


## *Cloning* a local copy

Even though you have *forked* the course repository, you must still create a *local copy* on your computer in order to edit and run the codes with MATLAB or Spyder.  In order for this local version to be synchronize with your forked copy on GitHub you must *clone* your online repository.  To do this you need the URL for your forked copy, which can be obtained by visiting its website, clicking the "Code" button and then selecting and copying the URL from the menu that pops up.  Then you need to open a computer terminal window and navigate to the directory/folder where you wish to store the local (i.e. on your computer) version of the code.  From there you can execute the clone operation via a command:

```zsh
git clone https://github.com/mattzett/EP501_python1.git
```

Note that you will need to paste in the URL corresponding to your forked version of the repository.  This creates a copy of your forked repository in the subdirectory "EP501_python1".  

Your local copy of the code can now be edited with any software that you wish, including VIM, MATLAB editors, or Spyder.  Every change that you make will be tracked via "git" when you clone the repo this way.

## *Committing* code changes

Once you work with your local copy and make changes you can create *commits* to make it easier to track development of your code and associated errors.  A commit is a "bookmark" to a "snapshot" of the state of your code at the time that it is made.  As such as you are developing you will want to make commits (bookmarks) fairly often so that you can go back and view the state of your code at any point in the past at which you've made a commit.  A key feature of "git" is that allows you to view or work with a copy of the code corresponding to any *commit* that you or anyone else have ever made on your repository.  Once you have made source code changes and wish to make a commit, you can do so by issuing a command from the main repo directory like:

```zsh
git commit -am "message describing changes in this commit"
```

All subsequent commits will be tracked, as well; one can view a list of commits via the command:

```zsh
git log
```

Alternatively if you have pushed your local commits (see section below), you can view the entire development history on the GitHub website.  You can *checkout* a copy of the code corresponding to any past commit via a command like:

```zsh
git checkout 1fce8a
```
where "1fce8a" should be the commit identifier corresponding to whichever commit you wish to view (a list of these identifiers can be seen by using ```git log```).  Issuing the checkout command basically copies the older version of the code over the contents of the directory that you are working in so that directly then contains the exact state of the code corresponding to that commit.  Once this is done you can run, alter, or otherwise test that specific commit as you would normally.  

To return to the most recent commit that you have made on a repo, you need to use the command:

```zsh
git checkout master
```
This resets all files in your directory back to their *most recent commit* versions for branch "master".  


## Adding new source code files to the repository

To include addtional source code files in your local repository you will need to create and edit these files in whatever editor you use and then save them in a directory in your local repo.  They can then be put under version control via:

```zsh
git add filename.{py,m}
```


## Viewing changes

Changes to the local copy of your source coded are automatically tracked by git.  You can see a list of changed files since the last commit via:

```zsh
git status
```

You can view a list of changes (from the last commit) to a single file via (in this example "test.py":

```zsh
git diff test.py
```


## *Pushing* local commits back to your *remote* repository

Once you have committed all changes, you can push (synchronize) these to the remote repository by issuing the command:

```zsh
git push
```

from the base directory of the repo on your local computer.  You will see output indicating whether or not the push was successful; if so your local copy will now be in the remote repository and viewable on GitHub (i.e. on the website).  

A push will typically only fail if the remote copy of the repository contains code changes that you do not have locally.  Because of this you should always *pull* the remote repository before you start working on changes to the code, i.e. do:

```zsh
git pull
```

from the local directory on your computer containing the cloned repo.  


## *Pulling* and *merging* codes

If a ```git push``` fails you will need to first ```git pull``` the remote work, which will be *merged* with your existing changes.  Provided that you have not edited any lines of code locally that have been changed in the remote repo, this merge will be automatic and the result will contain all changes from both the local and remote repos.  

If you have changed the same line of code as has been changed on the remote, then you will be given a notification that you need to resolve this *merge conflict* manually.  The offending file(s) will be marked on lines that have a conflict so that you can easily search for them.  In the case of the merge conflict git will give you a warning that outlines which files it could not automerge:

```zsh
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.
```

These conflicts have to be manually resolved.  If you open the offending file (in the case above README.md) the merge conflict will be marked for you by text similar to:

```zsh
<<<<<<< HEAD
## Codes for FA2020 semester
=======
## Codes current as of FA2020 semester
>>>>>>> mergedemo2
```

The line(s) above the ```=======``` are the lines in your current copy of the code, while the lines following this are the lines you are attempting to merge into this copy.  Effectively you will need to choose either of the conflicting options (by deleting the rest) or you will need to manually combine them.  Once you are done editing the source code file, from the command line you will need to add the file back to the repo to tell git that you have manually resolved the conflict:

```zsh
git add filename.{py,m}
```

You can now commit the results to finish resolving the conflicted merge that you began:

```zsh
git commit -am "resolve README merge conflict"
```

Note that there are additional ways to effectively merge codes (i.e. ```git rebase```) that may be more appropriate than ```git merge``` in some situations, but we will not use or cover those in this course.  


## Merging the upstream repo into your local copy

In many cases the upstream repo that you forked may be changed, e.g. to include other example files or for bug fixes.  In that case you do not need to copy all of your GitHub/local changes manually into the new copy of the code or fork it again.  Your copy is still effectively linked to the upstream so you can use git's merge capabilities to incorporate upstream changes automatically into your code.  

```zsh
git pull https://github.com/Zettergren-Courses/EP501_python.git master
```

The final argument for this comments refers to the local branch that you want to merge the upstream into.  Unless you are creating seperate branches for development, this will usually be the "master" branch.  As with a "normal" merge, if you have modified the same line of code as the upstream you will need to manually resolve the conflict [as described above](#*Pulling*-and-*merging*-codes).  Note that this merges the upstream copy with your local branch and, in order to synchronize your local copy with your GitHub copy you will need to resolve all conflicts and then do a:

```zsh
git push
```


## Creating additional *branches* of your code

Most development tasks that are larger than a handful of source files will make use of multiple code *branches* - copies of the code in your repo with different states or development histories.  For example, if you would like to create a separate copy of your code for a particular project (say for project 1), you can use the command:

```zsh
git checkout -b project1
```

which will create a new branch named "project1".  This branch code can/will have a separate development history from the default branch (called "master").  You can switch branches using:

```zsh
git switch master
```

which switches back to the master branch, or

```zsh
git switch project1
```

which will switch to the "project1" branch.  You can print a list of available branches using:

```zsh
git branch -a
```

Branched copies of your code are still linked to master in the sense that they share a common ancestor, namely the copy that they branched from (usually master unless you have a really complicated dev workflow).  As such branches that you create can be merged with master (or vice versa).  


## Suggested git workflow

For this course it is recommended that you create a separate branch (copy) for each assignment and that you not directly edit the master branch.  This is useful because then master will always be able to auto-merge with the upstream repo without any conflicts.  Thus you will have different branches, "project1", "project2", and so on corresponding to your solutions for each assignment.  In between assignments you'll want to merge your master branch with the upstream copy that I provide in order to have all available examples and bugfixes.  

You are free to, of course, develop your own git workflows but be warned that git is a complicated program and one can do any number of "nonstandard" things will it that will create excessive amounts of conflict, etc.

Note that many of the command line functions invoked here can be access through a GUI called GitHub desktop (see [https://desktop.github.com](https://desktop.github.com)) should you prefer to use that.  
