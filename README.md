# jest.nvim

Ability to invoke jest within nvim.

Inspired by [coc-jest](https://github.com/neoclide/coc-jest), which is
dependent on coc.nvim.

## Requirements

* Neovim
* Jest (within node_modules of working project)

## Installation

```vim
Plug 'kubejm/jest.nvim'
```

## Usage

| Command       | Description                        |
| ---           | ---                                |
| `:Jest`       | Run Jest on entire project         |
| `:JestFile`   | Run Jest on file in current buffer |
| `:JestSingle` | Run Jest on test name under cursor |
