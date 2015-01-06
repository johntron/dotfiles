# dotfiles
John Syrinek's dotfiles

## Installation
```sh
    ./install.sh
```

Optional (for ctags support in vim):
```sh
brew install ctags-exuberant
```

Optional (for jslint support in vim):
```sh
npm install -g jslint
```

## Usage
vim:
* Press <tab> for autocomplete
* `gf` to go to file/module under cursor
* `:Nedit module` to edit module's index.js
* `html:5` then ctrl-Y,comma to expand to HTML5 boilerplate
* `:Tlist` when editing sourcecode to view ctags
* `:ln` goes to next jslint error; `:lopen` opens list of errors; Requires jslint (see Installation).

## Next steps
On OS X, use Homebrew to install quicklook plugins (see github.com/sindresorhus/quick-look-plugins): 
```sh
brew install caskroom/cask/brew-cask
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
```
