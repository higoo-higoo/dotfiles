local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  -- use({ "morhetz/gruvbox" })
  -- use({
  -- 	"rebelot/kanagawa.nvim",
  -- 	config = function()
  -- 		require("plugins.kanagawa")
  -- 	end,
  -- })
  use({
    "Mofiqul/dracula.nvim",
    config = function()
      require("plugins.dracula")
    end,
  })
  -- use({
  -- 	"navarasu/onedark.nvim",
  -- 	config = function()
  -- 		require("plugins.onedark")
  -- 	end,
  -- })
  -- use({
  -- 	"catppuccin/nvim",
  -- 	as = "catppuccin",
  -- 	config = function()
  -- 		require("plugins.catppuccin")
  -- 	end,
  -- })
  -- use({
  -- 	"folke/tokyonight.nvim",
  -- 	config = function()
  -- 		require("plugins.tokyonight")
  -- 	end,
  -- })
  use({
    "akinsho/bufferline.nvim",
    tag = "*",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.bufferline")
    end,
  })
  use({
    "skanehira/denops-silicon.vim",
    requires = "vim-denops/denops.vim",
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.lualine")
    end,
  })
  use({
    "simeji/winresizer",
    config = function()
      vim.keymap.set("n", "<Leader>w", "<Cmd>WinResizerStartResize<CR>", {})
    end,
  })

  use({
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  })
  use({
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  })
  use({
    "gen740/SmoothCursor.nvim",
    config = function()
      require("smoothcursor").setup()
    end,
  })
  -- File Explorer
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("plugins.telescope")
    end,
  })
  use({
    "kyazdani42/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.nvim-tree")
    end,
  })

  -- Git
  use({ "tpope/vim-fugitive" })
  use({ "airblade/vim-gitgutter" })
  use({
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("plugins.gitlinker")
    end,
  })
  -- nvim v0.7.2
  use({
    "kdheepak/lazygit.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.lazygit")
    end,
  })


  use({
    "hat0uma/csvview.nvim",
    config = function()
      require("csvview").setup()
    end,
  })
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({})
    end,
  })
  use({
    "GCBallesteros/jupytext.nvim",
    config = function()
      require("jupytext").setup()
    end,
  })

  -- NotebookNavigator & Molten (Jupyter notebook-style cell execution)
  use({
    "GCBallesteros/NotebookNavigator.nvim",
    requires = {
      "echasnovski/mini.comment",
      "anuvyklack/hydra.nvim",
      {
        "benlubas/molten-nvim",
        tag = "v1.*",
        run = ":UpdateRemotePlugins",
        requires = {
          {
            "3rd/image.nvim",
            config = function()
              require("image").setup({
                backend = "kitty",
                max_width = 500,
                max_height = 500,
                max_height_window_percentage = math.huge,
                max_width_window_percentage = math.huge,
                window_overlap_clear_enabled = true,
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
              })
            end,
          },
        },
        config = function()
          vim.g.molten_image_provider = "image.nvim"
          vim.g.molten_output_win_max_height = 500
          -- vim.g.molten_auto_open_output = true
          -- vim.g.molten_virt_text_output = true
          -- vim.g.molten_virt_lines_off_by_1 = true
        end,
      },
    },
    config = function()
      require("notebook-navigator").setup({
        -- activate_hydra_keys = "<leader>m",
        repl_provider = "molten",
      })

      -- key mappings
      vim.api.nvim_set_keymap(
        "n",
        "]h",
        "<cmd>lua require('notebook-navigator').move_cell('d')<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "[h",
        "<cmd>lua require('notebook-navigator').move_cell('u')<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>rc",
        "<cmd>lua require('notebook-navigator').run_cell()<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>rm",
        "<cmd>lua require('notebook-navigator').run_and_move()<cr>",
        { noremap = true, silent = true }
      )
    end,
  })
  use({
    "olimorris/codecompanion.nvim",
    config = function()
      require("plugins.codecompanion")
    end,
  })
  use("ray-x/go.nvim")
  use({
    "nvim-flutter/flutter-tools.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("plugins.flutter-tools")
    end,
  })
  use({
    "is0n/jaq-nvim",
    config = function()
      require("plugins.jaq-nvim")
    end,
  })
  use({
    "github/copilot.vim",
    config = function()
      require("plugins.copilot")
    end,
  })
  use({
    "vim-scripts/DoxygenToolkit.vim",
    config = function()
      vim.keymap.set("n", "<Leader>dox", "<Cmd>Dox<CR>", {})
    end,
  })
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use({
    "stevearc/conform.nvim",
    config = function()
      require("plugins.conform")
    end,
  })
  use({
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugins.toggleterm")
    end,
  })
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = {
        "markdown" }
    end,
    ft = { "markdown" },
    config = function()
      require("plugins.markdown-preview")
    end,
  })
  use({
    "vinnymeller/swagger-preview.nvim",
    run = "npm install -g swagger-ui-watcher",
    config = function()
      require("plugins.swagger-preview")
    end,
  })

  -- LSP
  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-cmdline")
  use({
    "dcampos/nvim-snippy",
    config = function()
      require("plugins.nvim-snippy")
    end,
  })
  use("dcampos/cmp-snippy")
end)
require("plugins.lspconfig")
