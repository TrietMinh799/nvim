local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<C-l>', '<cmd>noh<CR>')
map('n', '<C-c>', '<cmd>CHADopen<cr>')
map('n', '<silent> [g', '<Plug>(coc-diagnostic-prev)')
map('n', '<silent> ]g', '<Plug>(coc-diagnostic-next)')
map('n', '<silent> gd', '<Plug>(coc-definition)')
map('n', '<silent> gy', '<Plug>(coc-type-definition)')
map('n', '<silent> gi', '<Plug>(coc-implementation)')
map('n', '<silent> gr', '<Plug>(coc-references)')
map('n', '<silent> <TAB>', ':call <SID>show_documentation()<CR>')
map('n', 'rn', '<Plug>(coc-rename)')
map('x', '<leader>a', '<Plug>(coc-codeaction-selected)')
map('n', '<leader>a', '<Plug>(coc-codeaction-selected)')
map('i', '<silent><expr> <c-space>', 'coc#refresh()')

vim.cmd[[
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
          execute 'h '.expand('<cword>')
        elseif (coc#rpc#ready())
          call CocActionAsync('doHover')
        else
          execute '!' . &keywordprg . " " . expand('<cword>')
        endif
      endfunction

    autocmd CursorHold * silent call CocActionAsync('highlight')

    augroup mygroup
        autocmd!
        "Setup formatexpr specified filetype(s).
            autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
            autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
]]