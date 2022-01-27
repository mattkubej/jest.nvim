# jest.nvim

Ability to invoke jest within nvim.

Inspired by [coc-jest](https://github.com/neoclide/coc-jest), which is
dependent on coc.nvim.

<img src="https://raw.githubusercontent.com/kubejm/jest.nvim/master/demo.gif" />

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

## Configuration

```vim
let g:jest_cmd = 'yarn test --silent' " npx jest by default
```

Or in lua:

```lua
vim.g.jest_cmd = 'yarn test --silent' -- npx jest by default
```

You can use [klen/nvim-config-local] to set this on a per-project basis.

[klen/nvim-config-local]: https://github.com/klen/nvim-config-local
