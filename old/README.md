# John Syrinek's dotfiles

## Installation

```sh
./install.sh
```


## Shell usage

* Type `l <path>` to `ls -al` on `<path>`
* Type `z <path>` to navigate to frequently-used path matching `<path>`
* Press <Ctrl-T> to fuzzy search for files


## Vim usage

* `<C-P>`: fuzzy search and open files in new tab
* `,.`: go to next tab
* `,,`: go to previous tab
* `:vsplit`: split screen vertically (opposite of `:split`)
* `<C>w<Right>`: switch to pane on right of current (works with any arrow keys)
* `<C>wq`: close current pane
* `<Tab>`: autocomplete (builtin)
* `<,-t>`: to view tags
* `gf`: go to file/module under cursor (builtin)
* `ctrl-]`: goto definition of function/method under cursor
* `,hp`: preview git diff hunk
* `,hn`: preview next git diff hunk
* `:Nedit module`: edit module's index.js
* `<,-m>`: expand HTML using Emmet
* `:ln`: go to next eslint error
* `:lopen`: open list of eslint errors
* `:call JsBeautify()`: beautify current JavaScript file
* `:call HtmlBeautify()`: beautify current HTML file
* See [vimawesome.com](http://vimawesome.com/) for more plugins - install using [Pathogen](https://github.com/tpope/vim-pathogen)

