![Entry level: beginner](https://img.shields.io/badge/Entry%20level-beginner-brightgreen.svg)

# Development Environment Helpers: git

This repo contains opinionated recommendations and suggestions
as to the tools that many frontend developers (especially beginners)
will find useful.

If you are a beginner frontend developer you may also find
[`dev-env-frontend`](https://github.com/OleksiyRudenko/dev-env-frontend)
recommendations useful.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Intro](#intro)
- [Basic setup](#basic-setup)
  - [Credentials manager](#credentials-manager)
- [Friendly git editor](#friendly-git-editor)
  - [What might go wrong?](#what-might-go-wrong)
- [Git Helpers](#git-helpers)
  - [CLI Enhancements](#cli-enhancements)
  - [Git Aliases](#git-aliases)
  - [Git Flow](#git-flow)
    - [Basic flow](#basic-flow)
    - [Git Town](#git-town)
- [More resources on tweaking git](#more-resources-on-tweaking-git)
- [Advanced](#advanced)
  - [Subrepo](#subrepo)
- [IDE minimal tweak](#ide-minimal-tweak)
  - [`.editorconfig`](#editorconfig)
- [Issues?](#issues)
- [Contributors](#contributors)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
<!-- generated with [DocToc](https://github.com/thlorenz/doctoc) -->

## Intro

This repo contains scripts that make git users'
and project maintainers' life easier.

All scripts are optional. It is recommended that you look
into the script of your choice before using it.
Some scripts require you to patch e.g. file path before they
can be efficiently invoked.

Some tools/scripts are specific to Windows OS (as denoted).
Under Windows scripts are intended to get launched under
e.g. Git Bash that comes bundled with git distribution.
It would be available from file explorer context menu.

In terminal navigate to this project directory and execute
`chmod u=rwx *.sh` to make shell scripts executable.

Remember to precede script with explicit path, e.g. `./script.sh`

## Basic setup

Get registered with [github.com](https://github.com/).

Install [git](https://git-scm.com/downloads).

**Notes for Windows users**
> When prompted to choose an editor
> it is recommended that you opt for `Notepad++` (a GUI enabled
> editor) or `Nano` (non-GUI, yet friendlier to beginners than
> `vim`).
> When prompted for extra options enable file system caching.

Open Terminal (Git Bash under Windows). The most of the instructions
below are to be completed in Terminal.

<details><summary>A note for Windows users (click to expand)</summary>
Did you you can open git bash from File Explorer?
Locate your project (or just e.g. any directory in your file system)
in File Explorer, right click within explorer window 
to open context menu and select "Git Bash Here" option.

Bash will get opened in context of your project. 

![git bash context menu](./media/git-bash-context-menu.png)
</details>

**All OS**

Execute following commands to have your git identity configured.
Replace **"John Doe"** with your real name (obey quotes)
and **johndoe@example.com** with the email you used to register
on GitHub.
```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

_Note!_ Copy-paste + edit are your best friends at the most of times.

Navigate to the location you gonna have your development projects in.
Your home directory is a good point to start at.
You can get to your home directory by executing `cd ~/` command in Terminal.

Next execute the following commands one-by-one to have all required
files from this repository on your machine:
```
git clone https://github.com/OleksiyRudenko/dev-env-git.git
cd dev-env-git
```

Execute `chmod u=rwx *.sh` to make shell scripts executable.

You may close Terminal eventually.
You can get back to this project at any time by executing the following
command in terminal to catch up:
```
cd ~/dev-env-git
```

### Credentials manager

Credential manager helps to avoid authorization phase at
every operation on remote repo with git.

**Windows**:
Install [Git Credential Manager for Windows](https://github.com/Microsoft/Git-Credential-Manager-for-Windows/releases).
For downloads unfold and check **Assets** subsection below latest release 
**Change Log**.

**MacOS**: OSX keychain store is used by default, no need to install anything.
Just tell Git to use the KeyChain to store your credentials:

`git config --global credential.helper osxkeychain`

**Linux Mint/Ubuntu**

Execute `./credential-manager-linux.sh` in Terminal:

If any command fails try googling the error message to fix the issue.

Alternatively, for Linux you may try
[Git Credential Manager from Microsoft](https://github.com/microsoft/Git-Credential-Manager-for-Mac-and-Linux/blob/master/Install.md#installing-on-linux-using-rpm-recommended).

**Success criteria**: when Credential Manager is installed properly
git will ask for access credentials only once per each remote repos
storage (e.g. GitHub), normally on first attempt to push your local
repo to the remote.

If under **Windows** you are getting prompted for credentials repeatedly
or presented with an error message
```
fatal: HttpRequestException encountered.
   An error occurred while sending the request.
fatal: HttpRequestException encountered.
   An error occurred while sending the request.
Username for 'https://github.com':
```
try the following command: `git config --global credential.modalPrompt true`.
Check official [docs](https://github.com/microsoft/Git-Credential-Manager-for-Windows)
for the fixes for other possible issues you may face. Keep this project
among your bookmarks just for the case you face the authentication issue
at some later time.

## Friendly git editor

Many won't find `vim` or `vi` (that are used by default by git)
friendly enough.

Alternatives are:
- [GNU emacs](https://www.gnu.org/software/emacs/download.html)
- [Sublime Text](https://www.sublimetext.com/3)
- [Visual Studio Code](https://code.visualstudio.com/download)
- [Notepad++](https://notepad-plus-plus.org/download/) (Windows only)
- `nano` (Linux/MacOS only)

**NB**: Windows `Notepad.exe` is not a recommended option as
it doesn't support Linux linefeed.

**Windows**: if you're opted for `Notepad++` or `Nano` when
when installed git and you're happy with your choice, 
you may skip this section completely. 

You may opt for a different editor of your choice. There is a couple of basic
requirements it should meet:
- support Linux style linefeed
- CLI friendly (normally offers an option like `--wait` to correctly handle files)
- be lightweight enough to start quickly

Google for "your-editor-name as a git editor" to check how to use your
favourite editor with git.

Install an editor of your choice (`git-editor-linux.sh` contains
instructions to install `nano` or `emacs`).

**Emacs under Windows**: unpack 
[distribution archive](http://ftp.gnu.org/gnu/emacs/windows/emacs-26/emacs-26.1-x86_64.zip)
into `C:/Program Files/emacs`

**MacOS**: You may need to move downloaded installations to Applications.

Some editors come pre-bundled with OS, so try launching the editor of
your choice from Terminal to know if you need installing it first.

Open corresponding `git-editor-<platform>.sh` to edit.

Uncomment section that corresponds to your editor of choice and edit
the path to the editor executable as the pre-defined may not match actual
installation path.

Linux CLI commands `command -v <executable_name>` and `which <executable_name>`
may help you to find proper path.

Then launch the script with `./git-editor-<platform>.sh`.

If the editor of your choice opens and you see something like
```
[user]
	name = John Doe
	email = john.doe@example.com
	username = JohnDoe
[core]
	editor = 'D:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin ''
	pager = cat
[credential]
	helper = wincred
``` 
then you have succeeded. Just close the editor.

### What might go wrong?

**You can see the file above but the editor is not the one you expected.**

You might not have all lines relevant to your editor in 
`./git-editor-<platform>.sh` uncommented. So, the default editor didn't change.

1. Quit the editor.
   - If editor shows commands in a toolbar then press a relevant hot-key
     (normally `^X` or `^Q`)
   - If editor offers GUI then option to quit is located under File menu
   - You may find yourself in `vim` or `vi`. Press `ESC`, type `:q!` and
     hit `Return` key 
2. Uncomment relevant commands in `./git-editor-<platform>.sh` 
   by removing leading `# `. 
3. Launch `./git-editor-<platform>.sh`

**Editor didn't start. Some error reported**
 
The path to the editor in `./git-editor-<platform>.sh` is not correct.

1. Fix path to your editor in `./git-editor-<platform>.sh`.
   Try finding proper path to your editor. Optionally consult google
   for a proper path to the editor of your choice as described in 
   this section above.
2. Launch `./git-editor-<platform>.sh`

**If you do not succeed either** then try setting different editor.
Do not forget to comment back failing commands in `./git-editor-<platform>.sh`
before uncommenting commands for a different editor. Or yell for help
in your student community. 

## Git Helpers

### CLI Enhancements

Make your terminal shell prompt informative.
Executing `./cli-tune.sh` will copy `.bash_profile`, 
`git-completion.bash` and `git-prompt.sh` to your $HOME.

The above improves CLI by e.g. adding info about current git branch
to the shell prompt and adding auto-completion feature to git commands
(branch names, commands per se, etc.).

It may happen that either of file copying operation fails. Most likely
either of files already exists at target directory (`~/`). There are
chances you have already tuned your CLI for git any time before.
As for the `.bash_profile` you may already have one, then just
update `~/.bash_profile` with contents of this project's `.bash_profile`.

You'll need to close and re-open Git Bash before any changes take effect.

Credits:
[Udacity](https://classroom.udacity.com/courses/ud775/lessons/2980038599/concepts/33417185870923)

Learn more about
[Customizing Linux/Mac terminal prompt](https://gist.github.com/ankurk91/2efe14650d54d7d09528cea3ed432f6d)

### Git Aliases

Executing `./git-helpers.sh` will:
 * add global `.gitignore` to ignore most common file patterns
 * add a collection of aliases/shorthands  
 
 * Study `git-helper.sh`, try commands assigned to aliases
   on some of your repos to see what those do.
   Some of aliases:

**More on global `.gitignore`**:
Global `.gitignore` decreases a risk of tracking of the most
common files to be ignored (IDE settings, temporary files,
directories for app builds etc). Global `.gitignore` works 
even when the project doesn't contain its own `.gitignore`.
You may add more rules or remove some by editing `~/.gitignore`.

**More on aliases**:
Adding those is not harmful, using can be.
Study `git-helper.sh`, try commands assigned to aliases
on some of your repos to see what those do.

### Git Flow

#### Basic flow

Executing `./git-flow-basic.sh` will add aliases to support some
basic git flow:
 * `sync-master-upstream` - updates local `master` and `origin/master`
   with `upstream/master`
 * `sync-branch-upstream-merge`
   - calls `sync-master-upstream`
   - updates feature branch from `master` using simple merge strategy
 * `sync-master` - updates local `master` from `origin/master`
   when on a feature branch
 * `sync-branch-rebase` - rebases current branch onto (updated)
   `master`; conflicts may arise
 * `sync-branch-continue` - completes reabasing after conflict resolution

Add and use those when you clearly understand what is behind. This
is also a rather source of inspiration to build your own git flow
than a commonly recognized pattern.

#### Git Town

Git town is yet another opinionated git flow toolset.

Learn and use [git-town](http://www.git-town.com/install.html)
when you feel it matches the git flow you'd use.

Executing `./git-town-set.sh` offers some initial settings, and
works when git town is installed.

## More resources on tweaking git

 * [First-Time Git Setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)
 * [yevhenorlov/dotfiles@github](https://github.com/yevhenorlov/dotfiles)
 * [Git going with aliases](https://hackernoon.com/git-going-with-aliases-a9706e23fa9c)
 * [https://medium.com/@vitalyb/creating-powerful-git-aliases-3dfc0efc9a31](https://medium.com/@vitalyb/creating-powerful-git-aliases-3dfc0efc9a31)
 * [robmiller/.gitconfig@github](https://gist.github.com/robmiller/6018582)

## Advanced

### Subrepo
 
[git-subrepo](https://github.com/ingydotnet/git-subrepo) is a great replacement
for `git-submodule` and `git-subtree`. 
Please, refer to:
 * [project docs](https://github.com/ingydotnet/git-subrepo/wiki)
   for more details
 * [Repo import and export back](https://gist.github.com/OleksiyRudenko/86d378b56fe690e47a066b8eeb4ac5b2)
   article for a use case
 * an [article in Russian](https://habr.com/ru/post/428493/) for a general overview
   (a bit outdated)

## IDE minimal tweak

Tune your editor/IDE so it ensures empty line at the end of file. 

Find and check the relevant setting. Examples:
  - IntelliJ IDEA products: File &gt; Settings (or _ProductName_ &gt; Preferences) 
    &gt; Editor &gt; General -- Ensure line feed at file end on Save
  - [VS Code](https://stackoverflow.com/questions/44704968/visual-studio-code-insert-new-line-at-the-end-of-files)
  - Sublime: Command Palette &gt; Preferences -- change or add `"ensure_newline_at_eof_on_save": true`

> This ensures that adding code/text at the end of file will not mark 
the fragment that actually had not been effectively changed 
(which takes place when a line doesn't end with LF character).
This makes history of changes cleaner and diffs reflecting actual changes.

### `.editorconfig`

Some editors and IDEs support [`.editorconfig`](https://editorconfig.org/)
out-of-the-box, others may require plugins.
Check how your editor/IDE is [supported](https://editorconfig.org/#download).

Copy `.editorconfig` with basic settings from this project to the root
directory of your own projects. 

If your own projects are located somewhere under your home
directory (the default case) `cp ./.editorconfig ~/` will do.

Your editor/IDE may require to enable `.editorconfig` somewhere in its settings. 

## Issues?

If anything above contains errors, not quite clear or requires
improvement or update, please, feel free adding an
[Issue](https://github.com/OleksiyRudenko/dev-env-git/issues).

## Contributors

There are people that contributed to this project by testing instructions
herein and providing their feedback. Support and willingness to help
is much appreciated.

- [sayckl](https://github.com/sayckl)
