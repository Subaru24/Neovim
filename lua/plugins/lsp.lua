
return {
  -- Mason for managing LSP binaries
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- optional: auto update registry
    config = function()
      require("mason").setup()
    end
  },

  -- Bridge between Mason and LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "bashls", "pyright" }, -- gdscript is NOT supported
        automatic_installation = true,
      })
    end
  },

  -- Actual LSP setup
{
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local servers = { "lua_ls", "bashls", "pyright" }
      for _, server in ipairs(servers) do
        local opts = {
          capabilities = capabilities,
        }

        -- Special settings for lua_ls
        if server == "lua_ls" then
          opts.settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                  "${3rd}/luv/library",
                },
              },
              telemetry = { enable = false },
            }
          }
        end

        lspconfig[server].setup(opts)
      end

      -- Manual GDScript config
      lspconfig.gdscript.setup({
        capabilities = capabilities,
        settings = {},
      })

      -- Keybindings
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end
  }
}


