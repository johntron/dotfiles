# dotfiles
John Syrinek's dotfiles

## Installation
```sh
    ./install.sh
```

Optional (for ctags and editorconfig support in vim):

```sh
brew install ctags-exuberant editorconfig
```

Optional (for jslint support in vim):

```sh
npm install -g jslint
```

## Usage
vim:

* Press `<tab>` for autocomplete
* Search for files with `:CtrlP` or ctrl-shift-O
* `gf` to go to file/module under cursor
* `:Nedit module` to edit module's index.js
* `html:5` then ctrl-Y,comma to expand to HTML5 boilerplate
* `:Tagbar` when editing sourcecode to view ctags
* Press `ctrl-]` to goto definition of function/method under cursor
* `:ln` goes to next jslint error; `:lopen` opens list of errors; Requires jslint (see Installation).
* `:call JsBeautify()` to beautify current JavaScript file
* See [vimawesome.com](http://vimawesome.com/) for more plugins - install using [Pathogen](https://github.com/tpope/vim-pathogen)

## Next steps
Install `ag` [the silver searcher](https://github.com/ggreer/the_silver_searcher) with:

```sh
brew install the_silver_searcher
```

Install [Powerline fonts](https://github.com/powerline/fonts) for fancy statusbars, command prompts, etc.

Enable 256 colors (requires a terminal emulator that supports these colors):

```sh
echo "export TERM=xterm-256color" >> ~/.profile
```

On OS X, use Homebrew to install [quicklook plugins](https://github.com/sindresorhus/quick-look-plugins): 

```sh
brew install caskroom/cask/brew-cask
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
```

Add an alias to generate ctags for local node modules:

```sh
echo "alias ctags_node='ctags -R --languages=JavaScript node_modules'" >> ~/.profile
```
