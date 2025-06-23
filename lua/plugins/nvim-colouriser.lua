return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      "*", -- Enable for all filetypes
    }, {
      RGB      = true; -- #RGB hex codes
      RRGGBB   = true; -- #RRGGBB hex codes
      names    = true; -- "blue"
      RRGGBBAA = true; -- #RRGGBBAA
      rgb_fn   = true; -- rgb() and rgba()
      hsl_fn   = true; -- hsl() and hsla()
      css      = true; -- Enable all CSS features: rgb_fn, hsl_fn, names, etc.
      css_fn   = true; -- Enable all CSS *functions*
    })
  end,
}
