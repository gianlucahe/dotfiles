return {
  "ThePrimeagen/vim-be-good",
  event = "VeryLazy",
  config = function()
    -- Keybinding to start vim-be-good
    vim.keymap.set("n", "<leader>vb", ":VimBeGood<CR>", { desc = "Start vim-be-good game" })
  end,
}