# Johntron's dotfiles

Clone this repo and add a few lines to your dotfiles - stuff with a "dot" prefix like ~/.profile - to up your shell game.


## Install

First, setup your startup files so they know where to find modules in this repo. There are examples in [startup-files/](startup-files/), but here's the manual steps:

1. In the login startup file (e.g. .zprofile), create an environment variable referencing this directory (git repo root): `export DOTFILES=$HOME/Development/dotfiles`
2. Ensure $DOTFILES will exist in interactive shells. This may require adding something like `source .zprofile` to a file like .zshrc. (see "OKWTF..." section below).

Next, use `source` in your login startup to load features in [login](login/). Here's an example:

```
source $DOTFILES/login/default-editor-vi
```

Next, use `source` in interactive startup to load features in [interactive/](interactive/)k:

```
source $DOTFILES/interactive/debian
source $DOTFILES/interactive/user-bin
source $DOTFILES/interactive/oh-my-zsh
source $DOTFILES/interactive/dockerized-node
source $DOTFILES/interactive/ssh-tunnel
```

Finally, if you added anything to a login startup file, logout and log back (including entire desktop session if you're in one). If you only added things to non-login files, just launch a new shell.


## OKWTF - .profile, .zprofile, .zshrc - which ones do I use?! (the hardest part)

Shells run a variety of files at startup depending on a variety of factors like OS, default shell, authentication method. When you open a shell for interactive input, there are two variants that might run: login and non-login (both interactive). These variants have separate sets of startup files that might be loaded (not always) - a dotfile with "profile" suffix for login shells and "rc" suffix for interactive shells.

You can't have an interactive shell without first launching a login shell; however, sometimes the login shell is _not interactive_ - it could be your desktop manager when you login. This means the startup scripts that run for login shell should avoid doing things that might be useful for an interactive shell, because an interactive shell may never start.

For these reasons, it's recommended to set important environment variables in the startup files for login shells, and only setup useful functions and tools in the startup files for interactive shells. This might mean setting environment variables in ~/.profile and aliases in ~/.zshrc.

Since it's very difficult to sort out which files might be used in all the different contexts, I use this method to figure out which ones are used for my purposes:

1. Set a default shell using a command like `usermod --shell /bin/zsh johntron`
2. Add these three files: a) shell-specific interactive rc file (e.g. .zshrc), b) shell-specific login file (e.g. .zprofile), and c) shell-agnostic login file (e.g. .profile)
3. In each of these files, add something like: `export DOTFILES_STARTUP="$DOTFILES_STARTUP, zshrc"` where "zshrc" is used to identify the file you added this statement to
4. Login using all the various methods you might use
5. Each time you login, run `echo $DOTFILES_STARTUP` and see what ran.

Now you should know which file to add environment variables to (for logins) and which to add useful stuff for interactive shells. Note: many terminal emulators launch a subshell when they start - you might be able to disable this to avoid doing things twice.


## Goals for my dotfiles

* Portable
* Simple

