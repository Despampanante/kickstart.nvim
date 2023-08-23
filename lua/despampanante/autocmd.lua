local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('HighlightYank', { clear = true })
local TheMainGroup = augroup('TheMain', {})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = yank_group,
  pattern = '*',
})

-- [[ Remove trailing whitespace on save]]
autocmd({ "BufWritePre" }, {
  group = TheMainGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})


