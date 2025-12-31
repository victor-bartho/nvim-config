return{
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
      require("catppuccin").setup{
        flavour = "mocha",
      }
    vim.cmd.colorscheme "catppuccin"
    end,
  },
  
  
  -- #### ROSE-PINE CONFIG 
  -- { 
  --   -- You can easily change to a different colorscheme. Change the name of the colorscheme plugin below, and then
  --   -- change the command in the config to whatever the name of that colorscheme is.
  --   --
  --   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  --   -- VICTOR: mudando tema do neovim
  --   'rose-pine/neovim', priority = 1000, -- Make sure to load this before all the other start plugins.
  --   config = function()
  --     ---@diagnostic disable-next-line: missing-fields
  --     require('rose-pine').setup {
  --       variant = 'auto', -- auto, main, moon, or dawn
  --       dark_variant = 'main', -- main, moon, or dawn
  --       dim_inactive_windows = false,
  --       extend_background_behind_borders = true,
  --       disable_italic = true,
  --
  --       enable = {
  --         terminal = true,
  --         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
  --         migrations = true, -- Handle deprecated options automatically
  --       },
  --
  --       highlight_groups = {
  --         -- Comment = { fg = "foam" },
  --         -- VertSplit = { fg = "muted", bg = "muted" },
  --         -- VICTOR: personalizar lineHighlightBackground
  --         CursorLine = { bg = '#ffffff', blend = 8 },
  --       },
  --
  --       before_highlight = function(group, highlight, palette)
  --         -- Disable all undercurls
  --         -- if highlight.undercurl then
  --         --     highlight.undercurl = false
  --         -- end
  --         --
  --         -- Change palette colour
  --         -- if highlight.fg == palette.pine then
  --         --     highlight.fg = palette.foam
  --         -- end
  --       end,
  --     }
  --     -- FIM DO PASTE DO REQUIRE()
  --     -- Load the colorscheme here.
  --     -- Like many other themes, this one has different styles, and you could load
  --     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --     vim.cmd.colorscheme 'rose-pine'
  --   end,
  -- },

}
