-- vim options
local tabstop = 4
vim.opt.autochdir = true
vim.opt.shiftwidth = tabstop
vim.opt.tabstop = tabstop
vim.opt.softtabstop = tabstop
vim.opt.expandtab = true
vim.opt.relativenumber = false
vim.opt.mouse = ""
vim.opt.colorcolumn = "81"
vim.opt.scrolloff = 5
vim.opt.backspace = "indent"
vim.opt.whichwrap = "b,s"
vim.opt.timeoutlen = 300

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldnestmax = 2
vim.opt.foldlevel = 0
vim.opt.foldminlines = 100
vim.opt.foldopen = "block,hor,mark,percent,quickfix,search,tag,undo"

-- general
lvim.log.level = "info"
lvim.format_on_save = {
    enabled = true,
    pattern = "*.lua",
    timeout = 1000,
}

-- to disable icons and use a minimalist setup, uncomment the following
lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
lvim.keys.normal_mode[";"] = ":"
lvim.keys.normal_mode["<C-s>"] = ":wa<cr>"
lvim.keys.normal_mode["<C-d>"] = "<cmd>vim.lsp.buf.definition()<CR>"
lvim.keys.normal_mode["<C-p>"] = lvim.builtin.which_key.mappings["f"][1]

lvim.keys.normal_mode["<M-h>"] = "<C-w>h"
lvim.keys.normal_mode["<M-j>"] = "<C-w>j"
lvim.keys.normal_mode["<M-k>"] = "<C-w>k"
lvim.keys.normal_mode["<M-l>"] = "<C-w>l"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["s"] = { "<cmd>wa<cr>", "Save all" }
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["n"] = lvim.builtin.which_key.mappings["h"]
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["u"] = { "<cmd>UndotreeToggle<CR>", "Undo Tree" }

-- Change theme settings
lvim.colorscheme = "vscode"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.rainbow.enable = false

lvim.builtin.telescope.pickers = {
    find_files = {
        layout_config = {
            width = 0.9,
            height = 0.9,
        }
    },
}

-- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>
lvim.lsp.diagnostics.virtual_text = true

-- always installed on startup, useful for parsers without a strict filetype
lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
    "lunarvim/colorschemes",
    "Mofiqul/vscode.nvim",
    "mrjones2014/nvim-ts-rainbow",
    "p00f/clangd_extensions.nvim",
    "mbbill/undotree",

    -- {
    --     "folke/trouble.nvim",
    --     cmd = "TroubleToggle",
    -- },

    -- {
    --     "debugloop/telescope-undo.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "debugloop/telescope-undo.nvim",
    --     },
    --     config = function()
    --         require("telescope").setup({
    --             extensions = {
    --                 undo = {
    --                     side_by_side = true,
    --                     layout_strategy = "vertical",
    --                     layout_config = {
    --                         preview_height = 0.8,
    --                         width = 0.8,
    --                         height = 0.8,
    --                     },
    --                 },
    --             },
    --         })
    --         require("telescope").load_extension("undo")
    --         -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
    --     end,
    -- },

    -- {
    --     "ggandor/leap.nvim",
    --     name = "leap",
    --     config = function()
    --         require("leap").add_default_mappings()
    --     end,
    -- },

    {
        'wfxr/minimap.vim',
        build = "cargo install --locked code-minimap",
        cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
        config = function()
            vim.cmd("let g:minimap_width = 10")
            vim.cmd("let g:minimap_auto_start = 1")
            vim.cmd("let g:minimap_auto_start_win_enter = 1")
        end,
    },
}

-- GitHub Copilot
table.insert(lvim.plugins, {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
        vim.defer_fn(function()
            require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
            require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
        end, 100)
    end,
})

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
