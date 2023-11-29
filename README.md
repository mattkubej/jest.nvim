# jest.nvim

Ability to invoke jest within nvim.

Inspired by [coc-jest](https://github.com/neoclide/coc-jest), which is
dependent on coc.nvim.

<img src="https://raw.githubusercontent.com/kubejm/jest.nvim/master/demo.gif" />

## Requirements

- Neovim
- NPM
- Jest (will be ran with `npx` if not found locally)

## Installation

### vim-plug

```vim
Plug 'mattkubej/jest.nvim'
```

### packer.nvim

```lua
use 'mattkubej/jest.nvim'
```

## Default configuration

```lua
require'nvim-jest'.setup {
  -- Jest executable
  -- By default uses 'npx jest'
  -- To override with an npm script, provide 'npm test --' or similar
  jest_cmd = '/relative/project/dir/node_modules/jest/bin/jest.js',

  -- Prevents tests from printing messages
  silent = true,
}
```

## Usage

| Command         | Description                              |
| --------------- | ---------------------------------------- |
| `:Jest`         | Run Jest on entire project               |
| `:JestFile`     | Run Jest on file in current buffer       |
| `:JestSingle`   | Run Jest on test name under cursor       |
| `:JestCoverage` | Run Jest on entire project with coverage |
