return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        defaults = {
          border = true,
          layout_config = {
            height = 0.9,
            width = 0.9,
            preview_cutoff = 0,
            horizontal = { preview_width = 0.60 },
            vertical = { width = 0.9, height = 0.9, preview_cutoff = 0 },
          },
        },
        pickers = {
          find_files = {
            layout_config = {
              height = 0.9,
              width = 0.9,
            },
          }
        },
        extensions = {
          fzf = {}
        }
      }

      -- Set telescope highlights to match black background
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#000000", fg = "#000000" })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "#000000", fg = "#000000" })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "#000000", fg = "#000000" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "#000000", fg = "#000000" })

      require('telescope').load_extension('fzf')

      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
      vim.keymap.set('n', '<leader>fd', function()
        require('telescope.builtin').find_files({ hidden = true })
      end, {})
      vim.keymap.set("n", "<space>en", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
      vim.keymap.set("n", "<space>ep", function()
        require('telescope.builtin').find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end)

      require "config.telescope.multigrep".setup()
    end
  }
}
