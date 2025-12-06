
-- LAZY
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
                vim.api.nvim_echo({
                        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                        { out, "WarningMsg" },
                        { "\nPress any key to exit..." },
                }, true, {})
                vim.fn.getchar()
                os.exit(1)
        end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
        {
                "sainnhe/everforest",
                config = function()
                        vim.g.everforest_enable_italic = true
                        vim.g.everforest_background = "hard"
                        vim.cmd.colorscheme("everforest")
                end,
        },
        {
                {
                        "kdheepak/lazygit.nvim",
                        lazy = false,
                        cmd = {
                                "LazyGit",
                                "LazyGitConfig",
                                "LazyGitCurrentFile",
                                "LazyGitFilter",
                                "LazyGitFilterCurrentFile",
                        },
                        dependencies = {
                                "nvim-telescope/telescope.nvim",
                                "nvim-lua/plenary.nvim",
                        },
                        config = function()
                                require("telescope").load_extension("lazygit")
                                vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })
                        end,
                },
        },
        {
                "lewis6991/gitsigns.nvim",
                opts = {
                        signs = {
                                add = { text = "+" },
                                change = { text = "~" },
                                delete = { text = "_" },
                                topdelete = { text = "‾" },
                                changedelete = { text = "~" },
                        },
                },
        },
        {
                "nvim-treesitter/nvim-treesitter",
                branch = 'master',
                lazy = false,
                build = ":TSUpdate",
                config = function()
                        require("nvim-treesitter.configs").setup({
                                ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
                                auto_install = true,
                                highlight = {
                                        enable = true,
                                },
                                incremental_selection = {
                                        enable = true,
                                        keymaps = {
                                                init_selection = "<leader>ss",
                                                node_incremental = "<leader>si",
                                                scope_incremental = "<leader>sc",
                                                node_decremental = "<leader>sd",
                                        },
                                },
                                textobjects = {
                                        select = {
                                                enable = true,

                                                lookahead = true,

                                                keymaps = {
                                                        ["af"] = "@function.outer",
                                                        ["if"] = "@function.inner",
                                                        ["ac"] = "@class.outer",
                                                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                                                        ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                                                },
                                                selection_modes = {
                                                        ['@parameter.outer'] = 'v', -- charwise
                                                        ['@function.outer'] = 'V', -- linewise
                                                        ['@class.outer'] = '<c-v>', -- blockwise
                                                },
                                                include_surrounding_whitespace = true,
                                        },
                                },
                        })
                end,
        },
        {"nvim-treesitter/nvim-treesitter-textobjects"},
        {
                "nvim-treesitter/nvim-treesitter-context",
                dependencies = { "nvim-treesitter/nvim-treesitter" },
                config = function()
                        require("treesitter-context").setup({
                                enable = true,
                                max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
                                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                                line_numbers = true,
                                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                                trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                                mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
                                -- Separator between context and content. Should be a single character string, like '-'.
                                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                                separator = nil,
                                zindex = 20, -- The Z-index of the context window
                                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
                        })
                        vim.keymap.set("n", "<leader>k", function()
                                require("treesitter-context").go_to_context(vim.v.count1)
                        end, { silent = true })
                end,
        },
        {
                "mason-org/mason.nvim",
                opts = {},
                config = function()
                        require("mason").setup()
                end
        },
        { 
                "neovim/nvim-lspconfig",
                config = function()
                        vim.lsp.config('dartls', {})
                        vim.lsp.enable('dartls')
                end
        },
        {
                "mason-org/mason-lspconfig.nvim",
                opts = {
                        ensure_installed = { "lua_ls", "rust_analyzer" },
                },
                dependencies = {
                        { "mason-org/mason.nvim", opts = {} },
                        "neovim/nvim-lspconfig",
                },
        }
})

