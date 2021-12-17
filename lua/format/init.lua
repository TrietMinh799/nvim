local prettierd = {
  function ()
    return {
      exe = "prettierd",
      args = {vim.api.nvim_buf_get_name(0)},
      stdin = true
    }
  end
}

require('formatter').setup({
  filetype = {
    javascript = prettierd,
    javascriptreact = prettierd,
    typescript = prettierd,
    typescriptreact = prettierd
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.tsx,*.jsx,*.html FormatWrite
augroup END
]], true)
