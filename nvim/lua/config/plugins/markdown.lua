return {
  {
    'dkarter/bullets.vim',
    ft = { 'markdown', 'text' },
  },
  {
    'plasticboy/vim-markdown',
    ft = { 'markdown' },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_conceal = 0
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
    config = function()
      require('render-markdown').setup({
        render_modes = { 'n', 'i', 'c', 't' },
        heading = { enabled = true, border = true, position = 'inline' },
        code = { enabled = true, style = 'full' },
        bullet = { enabled = true },
        checkbox = { enabled = true },
        quote = { enabled = true },
        link = { enabled = true },
        win_options = {
          conceallevel = { default = 0, rendered = 3 },
          concealcursor = { default = '', rendered = '' },
        },
      })
      vim.keymap.set('n', '<space>mp', '<cmd>RenderMarkdown toggle<cr>', { desc = 'Toggle Markdown Render' })
    end,
  },
}