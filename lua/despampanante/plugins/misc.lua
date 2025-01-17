-- You can add your own plugins here or in other files in this directory!
return {
    -- NOTE: First, some plugins that don't require any configuration

    {
        'ThePrimeagen/harpoon',
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

            vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
        end
    },

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',


    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim',  opts = {} },


    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        config = function()
            require("ibl").setup({
                scope = { enabled = false },
            })
        end
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} }
}
