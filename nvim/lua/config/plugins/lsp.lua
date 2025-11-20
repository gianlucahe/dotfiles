return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require("lspconfig").lua_ls.setup { capabilites = capabilities }
      require("lspconfig").ts_ls.setup { capabilities = capabilities }
      require("lspconfig").yamlls.setup { capabilities = capabilities }
      require("lspconfig").pyright.setup { capabilities = capabilities }

      require("lsp_lines").setup()
      vim.diagnostic.config { virtual_text = true, virtual_lines = false }

      vim.keymap.set("", "<leader>l", function()
        local config = vim.diagnostic.config() or {}
        if config.virtual_text then
          vim.diagnostic.config { virtual_text = false, virtual_lines = true }
        else
          vim.diagnostic.config { virtual_text = true, virtual_lines = false }
        end
      end, { desc = "Toggle lsp_lines" })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

          if vim.bo.filetype == "lua" or vim.bo.filetype == "python" or vim.bo.filetype == "typescript" or vim.bo.filetype == "javascript" or vim.bo.filetype == "json" then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
              end,
            })
          end
        end,
      })

      -- Auto-reload buffers when files change externally
      vim.api.nvim_create_autocmd({ 'FocusGained', 'CursorHold' }, {
        callback = function()
          if vim.bo.modifiable and not vim.bo.readonly then
            vim.cmd('silent! checktime')
          end
        end,
      })
    end,
  }
}
