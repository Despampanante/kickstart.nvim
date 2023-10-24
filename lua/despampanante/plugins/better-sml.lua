return {
  'jez/vim-better-sml',
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      desc = 'SML filetype stuff',
      pattern = 'sml',
      group = vim.api.nvim_create_augroup('vim-better-sml', { clear = true }),
      callback = function()
        vim.opt_local.conceallevel = 2
        vim.g.sml_greek_tyvar_show_tick = 1
        -- vim.keymap.set('n', "<leader>t", vim.cmd.SMLTypeQuery, { desc = "SMLTypeQuery" })
        -- vim.keymap.set('n', "<leader>gd", vim.cmd.SMLJumpToDef, { desc = "SMLJumpToDef" })
        vim.keymap.set('n', "<leader>is", vim.cmd.SMLReplStart, { desc = "SMLReplStart" })
        vim.keymap.set('n', "<leader>ik", vim.cmd.SMLReplStop, { desc = "SMLReplStop" })
        vim.keymap.set('n', "<leader>ib", vim.cmd.SMLReplBuild, { desc = "SMLReplBuild" })
        vim.keymap.set('n', "<leader>io", vim.cmd.SMLReplOpen, { desc = "SMLReplOpen" })
        vim.keymap.set('n', "<leader>iu", vim.cmd.SMLReplUse, { desc = "SMLReplUse" })
        vim.keymap.set('n', "<leader>ic", vim.cmd.SMLReplClear, { desc = "SMLReplClear" })
        vim.opt_global.conceallevel = 2
        -- au FileType sml nnoremap <silent> <buffer> <leader>ic :SMLReplClear<CR>
        -- au FileType sml nnoremap <silent> <buffer> <leader>ip :SMLReplPrintDepth<CR>
      end,
    })
    vim.g.sml_auto_create_def_use = 'always'
    vim.g.sml_greek_tyvar_show_tick = 1
  end
}
