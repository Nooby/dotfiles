require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>n", "<cmd>NERDTreeToggle<CR>", { desc = "Toggle Nerd Tree File Explorer"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
