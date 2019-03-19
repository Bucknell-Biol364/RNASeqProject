Project 3
================
Transcriptomics Noob
3/3/2019

## Collaboration with Git

For this project, all members of the class will be working on the same
git repo. This could pose all kinds of problems for pushing changes, if
we don’t follow the proper process of forking the repo. This tutorial is
adapted from <http://r-bio.github.io/intro-git-rstudio/>.

### Branching

We will each create a copy of the RNASeqProject Repo in our own personal
Github account. This is called a **fork** of the repo and it will make a
copy of all branches that are present at the time the copy is made. On
the top right of
[RNASeqProject](https://github.com/Bucknell-Biol364/RNASeqProject) repo,
click `Fork`. Then click your personal Github account, to create the
fork there.

Github should redirect you to the new forked repo, which is an exact
copy of the original repo. Now use R Studio, New Project, Version
Control, Git… to make a local repo of **your** forked copy.

After it has been cloned, we need to tell Git that this project has an
upstream version. There is no way of doing this within RStudio, so you
need to enter some commands in the shell. Go to Tools \> Shell, and
enter the address of the upstream repository

`git remote add upstream
https://github.com/Bucknell-Biol364/RNASeqProject.git`

Make sure that it worked by typing `git remote -v` in the shell. It
should display 4 lines, 2 that start with `origin` and the address of
your fork, and 2 that start with `upstream` and the address of the
upstream repository. Note that here we used `upstream` to name the
upstream repository but we could have given it another name. In this
case, upstream is just easy to remember and accurate.

A **branch** is a local copy of the repo where you can make changes
without worrying about messing up your master copy. Switch back to R
Studio and create a new **branch** to store your changes so they are
separate from your master repo. Click `New Branch` in the Git tab. Name
it test-branch or something relevant for the changes you plan.

Make sure that you are in the new test-branch (upper right of the Git
tab). Edit the Test.txt file by adding a line or two and save it. You
should now be able to Commit and Push this change to Github. However,
you have **NOT** changed the class repo, or even your own origin branch,
only your test-branch copy of it. You can use this personal copy to
perform your analysis and to Commit and Push changes as often as you
like. The stakes are higher now, because eventually you will be merging
your personal copy with the class master copy. Two new best practices
should be followed:

1.  Use meaningful Commit messages. This will help others to know
    whether to pull your changes.
2.  Do not change the original files. Make a copy of a file before
    changing it and then name it using your name.

The exception to this second rule will be Test.txt because we want to
create some git conflicts. After pushing the changes to Test.txt to your
personal repo, go back to github.com and refresh the page showing this
repo.

When you are done making changes to Test.txt, make sure they have been
Committed and Pushed. Go to GitHub to view your fork. You can select
which branch you are viewing using the Branch button. Switch to the
test-branch and click the green `Pull request` button. Follow the
instructions (leaving informative comments) to merge the branches by
creating a pull request. Then approve the Pull request to complete the
merge.

## Lab 8

For lab this week you will complete the [Galaxy](1-Galaxy.md) and
[SARTools](2-SARTools.md) tutorials. You should branch your personal
copy of the repo for the lab and then merge it into your master copy
when you are done with the analysis.

## Project 3

### Objectives:

1.  Perform a differential expression analysis pipeline for RNASeq
2.  Understand the differences between read mapping and pseudoalignment
3.  Compare different analysis options for measuring differential
    expression
4.  Use an R vignette to closely examine an RNASeq analysis pipeline
5.  Collaborate as a large group to compare 13 different analysis
    pipelines

### Tasks:

  - \[ \] Complete the [Galaxy Tutorial](1-Galaxy.md) using Salmon
    pseudoalignment
  - \[ \] Complete the [SARTools Tutorial](2-SARTools.md) using DESeq2
    differential expression analysis
  - \[ \] Repeat the SARTools analysis incorporating batch correction
  - \[ \] Compare the results of the SARTools analysis at the gene and
    transcript level
  - \[ \] Complete a different analysis pipeline and compare the results
    using [DE Browser](DEBrowser/DEBrowser.R)
  - \[ \] Collaborate to complete a report comparing the results from
    all analysis pipelines

### Pipelines:

    ## Warning: package 'knitr' was built under R version 3.5.2

bowtie2-\>DESeq2 bowtie2-\>edgeR bowtie2-\>limma kallisto-\>DESeq2 1 1 1
1 kallisto-\>edgeR kallisto-\>limma Sailfish-\>DESeq2 Sailfish-\>edgeR 1
1 1 1 Sailfish-\>limma Salmon-\>DESeq2 Salmon-\>edgeR Salmon-\>limma 1 1
1
1

|  X | Name              | Github.Username | Email.Address         | Pipeline          |
| -: | :---------------- | :-------------- | :-------------------- | :---------------- |
|  1 | Chad Sussman      | chadsussman     | <cbs019@bucknell.edu> | kallisto-\>DESeq2 |
|  2 | Cheyenne Moore    | cheyennelmoore  | <clm044@bucknell.edu> | bowtie2-\>limma   |
|  3 | Cheyenne McKinley | cheymcki        | <cnm006@bucknell.edu> | Salmon-\>limma    |
|  4 | Katie Bille       | KateBille       | <crm037@bucknell.edu> | bowtie2-\>DESeq2  |
|  5 | Emily Konishi     | emilyjkonishi   | <ejk016@bucknell.edu> | Salmon-\>DESeq2   |
|  6 | Julie Berhane     | jfberhane       | <jfb026@bucknell.edu> | kallisto-\>edgeR  |
|  7 | Ian Vogel         | ianvogel        | <irv001@bucknell.edu> | Sailfish-\>DESeq2 |
|  8 | Justin Koss       | jkoss6          | <jak074@bucknell.edu> | Sailfish-\>edgeR  |
|  9 | Jordan Simpson    | jssimpson20     | <jss052@bucknell.edu> | kallisto-\>limma  |
| 10 | Katie Edwards     | kme012          | <kme012@bucknell.edu> | Salmon-\>edgeR    |
| 11 | Megan Ritter      | mnr006          | <mnr006@bucknell.edu> | Sailfish-\>limma  |
| 12 | Matt McGauley     | mwm021          | <mwm021@bucknell.edu> | bowtie2-\>edgeR   |
