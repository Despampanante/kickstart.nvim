-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function()
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    }
  end,
  keys = {
    -- [[ General Mappings ]]
    {
      'n',
      '<leader>?',
      function() require('telescope.builtin').oldfiles() end,
      desc =
      '[?] Find recently opened files'
    },
    {
      'n',
      '<leader><space>',
      function() require("telescope.builtin").buffers() end,
      desc = '[ ] Find existing buffers'
    },
    {
      'n',
      '<leader>/',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = '[/] Fuzzily search in current buffer'
    },

    {
      'n',
      '<leader>gf',
      function() require('telescope.builtin').git_files() end,
      desc = 'Search [G]it [F]iles'
    },
    {
      'n',
      '<leader>sf',
      function() require('telescope.builtin').find_files() end,
      desc = '[S]earch [F]iles'
    },
    {
      'n',
      '<leader>sh',
      function() require('telescope.builtin').help_tags() end,
      desc = '[S]earch [H]elp'
    },
    {
      'n',
      '<leader>sw',
      function() require('telescope.builtin').grep_string() end,
      desc = '[S]earch current [W]ord'
    },
    {
      'n',
      '<leader>sg',
      function() require('telescope.builtin').live_grep() end,
      desc = '[S]earch by [G]rep'
    },
    -- [[ Diagnostic mappings ]]
    {
      'n',
      '<leader>sd',
      function() require('telescope.builtin').diagnostics() end,
      desc = '[S]earch [D]iagnostics'
    },
    {
      'n',
      '[d',
      function() vim.diagnostic.goto_prev() end,
      desc = 'Go to previous diagnostic message'
    },
    {
      'n',
      ']d',
      function() vim.diagnostic.goto_next() end,
      desc = 'Go to next diagnostic message'
    },
    {
      'n',
      '<leader>e',
      function() vim.diagnostic.open_float() end,
      desc = 'Open floating diagnostic message'
    },
    {
      'n',
      '<leader>q',
      function() vim.diagnostic.setloclist() end,
      desc = 'Open diagnostics list'
    },
  },
}
