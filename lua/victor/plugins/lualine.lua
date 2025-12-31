return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'auto',
      icons_enabled = 'true',
    },
    sections = {
      lualine_a = { { 'mode', right_padding = 2 }, 'branch' },
      lualine_b = { { 'diff', colored = true }, 'filename' },
      lualine_c = {}, --{ 'fileformat' }
      lualine_x = {},
      lualine_y = { 'filetype', 'progress' },
      lualine_z = { { 'location', left_padding = 2 } },
    },
  },
}
