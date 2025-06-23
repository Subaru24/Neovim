return {
  "folke/zen-mode.nvim",
  opts = {
	window = {
    backdrop = 0.95, 
    width = 80, 
    height = 1, 
    options = {
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showcmd = false,
      laststatus = 0,
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    todo = { enabled = false },
    alacritty = {
      enabled = false,
      font = "14", -- font size
    },
    },
  },
  on_open = function(win)
  end,
  on_close = function()
  end,
  }     
