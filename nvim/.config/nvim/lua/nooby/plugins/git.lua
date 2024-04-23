return {
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Git Integration
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = 'Fu[G]itive [S]tatus' })
      vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { desc = 'Fu[G]itive [B]lame' })
      vim.keymap.set('n', '<leader>gl', ':Git log<CR>', { desc = 'Fu[G]itive [L]og' })
      vim.keymap.set('n', '<leader>gd', ':Git diff<CR>', { desc = 'Fu[G]itive [D]iff' })
    end,
  },
}
