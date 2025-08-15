local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- Plugins --
  use "freeo/vim-kalisi"
  -- use "folke/tokyonight.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }

  use "qpkorr/vim-bufkill"

  use {"akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons"}

  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional
    },
  }

  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    -- or                            , branch = "0.1.x",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  use {"rmagatti/auto-session"}

  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

  use "mbbill/undotree"
  use "tpope/vim-fugitive"
  -- use "tpope/vim-commentary"
  use {
    "psf/black",
    branch = "stable",
  }

  use "zbirenbaum/copilot.lua"
  use "zbirenbaum/copilot-cmp"
  -- use {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     })
  --   end,
  -- }

  -- use {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot" },
  --   config = function ()
  --     require("copilot_cmp").setup()
  --   end
  -- }

  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      --- Manage LSP servers from neovim
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},

      -- LSP Support
      {"neovim/nvim-lspconfig"},

      -- Autocompletion
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"hrsh7th/cmp-cmdline"},
      {"hrsh7th/nvim-cmp"},
      {"L3MON4D3/LuaSnip"},
      {"saadparwaiz1/cmp_luasnip"},
      {"honza/vim-snippets"},
      -- {"rafamadriz/friendly-snippets"},
    }
  }

  use {
    "CopilotC-Nvim/CopilotChat.nvim",
    requires = {
      {"zbirenbaum/copilot.lua"},
      {"nvim-lua/plenary.nvim", branch = "master"},
    },
    run = "make tiktoken"
  }

  -- Configured in lsp-zero.lua:
  use ({
    "nvimdev/lspsaga.nvim",
    -- XXX Problematic line:
    -- after = "nvim-lspconfig",
    -- config = function()
    --   require("lspsaga").setup({})
    -- end,
  })

  use {
    "kevinhwang91/nvim-ufo",
    requires = {
      "kevinhwang91/promise-async",
      "luukvbaal/statuscol.nvim",
    },
  }

  use "Yggdroot/indentLine"

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  use "windwp/nvim-ts-autotag"

  use{
    "altermo/ultimate-autopair.nvim",
    event={"InsertEnter", "CmdlineEnter"},
    branch="v0.6", --recomended as each new version will have breaking changes
    config=function ()
      require("ultimate-autopair").setup({
        --Config goes here
      })
    end,
  }

  -- use {"itchyny/lightline.vim"}
  use {
    "vim-airline/vim-airline",
    requires = {
      "vim-airline/vim-airline-themes",
      "ryanoasis/vim-devicons",
    }, 
  }

  ------------------------------
  -- Distraction free plugins --

  -- use {
  --   "junegunn/goyo.vim",
  --   requires = {
  --     "junegunn/limelight.vim",
  --   }, 
  -- }

  -- use {
  --   "folke/zen-mode.nvim",
  --   requires = {
  --     "folke/twilight.nvim",
  --   }, 
  -- }

  -- use({
  --   "Pocco81/true-zen.nvim",
  --   config = function()
  --     require("true-zen").setup {
  --       modes = { -- configurations per mode
  --         ataraxis = {
  --           options = { -- options to be disabled when entering Minimalist mode
  --             number = false,
  --             relativenumber = false,
  --             showtabline = 0,
  --             signcolumn = "no",
  --             statusline = "",
  --             cmdheight = 1,
  --             laststatus = 0,
  --             showcmd = false,
  --             showmode = false,
  --             ruler = false,
  --             numberwidth = 0
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- })

  ------------------------------

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
