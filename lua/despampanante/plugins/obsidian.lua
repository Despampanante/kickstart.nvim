return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = { "BufReadPre /home/santi/myVault/**.md" },
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    dir = "~/myVault", -- no need to call 'vim.fn.expand' here
    -- see below for full list of options 👇
    mappings = {},
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },

  },

  config = function(_, opts)
    require("obsidian").setup(opts)

    vim.keymap.set("n", "gf", function()
      if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
      else
        return "gf"
      end
    end, { desc = { "Go to obsidian link" }, noremap = false, expr = true })
  end,
}
