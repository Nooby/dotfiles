return {

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions
        -- visual mode
        map('v', '<leader>ghs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[g]it [h]unk [s]tage (Visual)' })
        map('v', '<leader>ghr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[g]it [h]unk [r]eset (Visual)' })
        -- normal mode
        map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = '[g]it [h]unk [s]tage' })
        map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = '[g]it [h]unk [r]eset' })

        map('n', '<leader>gbs', gitsigns.stage_buffer, { desc = '[g]it [b]uffer [s]tage' })
        map('n', '<leader>gbr', gitsigns.reset_buffer, { desc = '[g]it [b]uffer [r]eset' })

        -- map('n', '<leader>ghu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
        -- map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
        map('n', '<leader>gbl', gitsigns.blame_line, { desc = '[g]it [b]lame [l]ine' })

        map('n', '<leader>gdd', gitsigns.diffthis, { desc = '[g]it [d]iff against index' })
        map('n', '<leader>gdD', function()
          gitsigns.diffthis '@'
        end, { desc = '[g]it [D]iff against last commit' })
        --
        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
      end,
    },
  },

  -- Git Integration
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = 'Fu[g]itive [s]tatus' })
      vim.keymap.set('n', '<leader>gbb', ':Git blame<CR>', { desc = 'Fu[g]itive [b]uffer [b]lame' })
      vim.keymap.set('n', '<leader>gl', ':Git log<CR>', { desc = 'Fu[g]itive [l]og' })
      vim.keymap.set('n', '<leader>gdt', ':Git difftool -y<CR>', { desc = 'Fu[g]itive [d]iff [t]ool' })
      vim.keymap.set('n', '<leader>gm', ':Git mergetool -y<CR>', { desc = 'Fu[g]itive [m]merge tool' })
    end,
  },
}
