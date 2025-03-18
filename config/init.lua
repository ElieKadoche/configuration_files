-- global
-- ------------------------------------------
-- ------------------------------------------

-- Set leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Disable Nerd font
vim.g.have_nerd_font = false

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Show mode
vim.opt.showmode = true

-- Synchronize clipboard between OS
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim_runtime/temp_dirs/undodir")

-- Use many much levels of undo
vim.opt.undolevels = 1000

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "> ", trail = "·", nbsp = "~" }

-- Preview substitutions live
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Maximum column
vim.opt.colorcolumn = "79"

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Ask to save file if unsaved changes
vim.opt.confirm = true

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Be smart when using tabs
vim.opt.smarttab = true

-- Auto indent
vim.opt.autoindent = true

-- Smart indent
vim.opt.smartindent = true

-- Number of spaces to use for autoindenting
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Always show the status line
vim.opt.laststatus = 2

-- Set show matching parenthesis
vim.opt.showmatch = true

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- custom
-- ------------------------------------------
-- ------------------------------------------

-- Use vim colorscheme
vim.opt.termguicolors = true
vim.cmd("colorscheme vim")

-- Change colors (use :highlight)
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3b3b3b" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#3b3b3b" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000", fg = "#00FF00" })
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000", fg = "#FFFFFF" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000", fg = "#FFFFFF" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000", fg = "#FFFFFF" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#FFFFFF", bg = "#000000" })
vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#FFFFFF" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Keep visual mode
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Disable arrow keys in normal mode
-- vim.keymap.set("n", "<left>", "<cmd>echo "Use h to move!!"<CR>")
-- vim.keymap.set("n", "<right>", "<cmd>echo "Use l to move!!"<CR>")
-- vim.keymap.set("n", "<up>", "<cmd>echo "Use k to move!!"<CR>")
-- vim.keymap.set("n", "<down>", "<cmd>echo "Use j to move!!"<CR>")

-- Keybinds to make split navigation easier
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Vertical split
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { silent = true })

-- Change spelllang
vim.opt.spell = false
vim.keymap.set("n", "<leader>sn", ":set nospell<CR>", { silent = true })
vim.keymap.set("n", "<leader>sf", ":set spelllang=fr<CR>:set spell<CR>", { silent = true })
vim.keymap.set("n", "<leader>se", ":set spelllang=en<CR>:set spell<CR>", { silent = true })

-- Move around buffers
vim.keymap.set("n", "<leader>h", ":bp<CR>", { silent = true })
vim.keymap.set("n", "<leader>l", ":bn<CR>", { silent = true })
vim.keymap.set("n", "<leader>x", ":BD<CR>", { silent = true })

-- 1 sentence per line
vim.keymap.set("n", "<leader>p", function()
	vim.cmd([[%s/\. \+/\.\r/g]])
end, { silent = true })

-- Install lazy
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

-- Plugins
require("lazy").setup({
	-- nvim-treesitter
	-- ------------------------------------------
	-- ------------------------------------------
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"bash",
					"bibtex",
					"c",
					"cmake",
					"cpp",
					"csv",
					"diff",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"lua",
					"make",
					"markdown",
					"markdown_inline",
					"python",
					"ssh_config",
					"vim",
					"vimdoc",
					"yaml",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				auto_install = true,
			})
		end,
	},

	-- nvim-tree.lua
	-- ------------------------------------------
	-- ------------------------------------------
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		config = function()
			-- Parameters
			require("nvim-tree").setup({
				renderer = {
					icons = {
						show = {
							file = false,
							folder = false,
							folder_arrow = false,
							git = false,
						},
					},
				},
			})
			vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<cr>")
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					local current_buf = vim.api.nvim_get_current_buf()
					if vim.fn.argc() == 0 and vim.fn.bufname(current_buf) == "" then
						vim.cmd("NvimTreeOpen")
					end
				end,
			})
		end,
	},

	-- bufferline.nvim
	-- ------------------------------------------
	-- ------------------------------------------
	{
		"akinsho/bufferline.nvim",
		config = function()
			local status_ok, bufferline = pcall(require, "bufferline")
			if not status_ok then
				return
			end
			bufferline.setup({
				options = {
					show_buffer_icons = false,
					show_close_icon = false,
					show_buffer_close_icons = false,
				},
			})
		end,
	},

	-- lualine.nvim
	-- ------------------------------------------
	-- ------------------------------------------
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "16color",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	},

	-- fzf-lua
	-- ------------------------------------------
	-- ------------------------------------------
	{
		"ibhagwan/fzf-lua",
		config = function()
			vim.keymap.set("n", "<leader>f", ":FzfLua files<cr>")
		end,
	},

	-- indent-blankline.nvim
	-- ------------------------------------------
	-- ------------------------------------------
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},

	-- csvview.nvim
	-- ------------------------------------------
	-- ------------------------------------------
	{
		"hat0uma/csvview.nvim",
		---@module "csvview"
		opts = {
			parser = { comments = { "#", "//" } },
		},
		cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
	},

	-- vimtex
	-- ------------------------------------------
	-- ------------------------------------------
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "skim"
		end,
	},

	-- lazydev.nvim
	-- ------------------------------------------
	-- ------------------------------------------
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	-- nvim-lspconfig
	-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
	-- ------------------------------------------
	-- ------------------------------------------
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Rename the variable under your cursor
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

					-- WARN: This is not Goto Definition, this is Goto Declaration
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				end,
			})

			-- Diagnostic Config
			-- See :help vim.diagnostic.Opts
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			--  Create new capabilities with nvim cmp, and then broadcast that to the servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Enable the following language servers
			-- Listed here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
			local servers = {
				pylsp = {
					cmd = { "pylsp" },
					filetypes = { "python" },
					settings = {
						pylsp = {
							plugins = {
								pycodestyle = {
									ignore = { "W391" },
									maxLineLength = 100,
								},
							},
						},
					},
				},
				lua_ls = {
					cmd = { "lua-language-server" },
					filetypes = { "lua" },
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
						},
						diagnostics = { disable = { "missing-fields" } },
					},
				},
				ltex = {
					cmd = { "ltex-ls-plus" },
					filetypes = {
						"bib",
						"gitcommit",
						"markdown",
						"org",
						"plaintex",
						"rst",
						"rnoweb",
						"tex",
						"pandoc",
						"quarto",
						"rmd",
						"context",
						"html",
						"xhtml",
						"mail",
						-- "text",
					},
					settings = {
						ltex = {
							language = "en-US",
						},
					},
				},
			}

			-- Ensure the servers and tools above are installed
			-- Listed here: https://mason-registry.dev/registry/list
			-- TODO: comment these lines if specific installation required
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"python-lsp-server",
				"lua-language-server",
				"bandit",
				"pydocstyle",
				"flake8",
				"typos",
				"stylua",
				"bibtex-tidy",
				"isort",
				"autopep8",
				"clang-format",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	-- lint
	-- ------------------------------------------
	-- ------------------------------------------
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			-- Listed here: https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
			lint.linters_by_ft = {
				python = { "bandit", "pycodestyle", "pydocstyle", "flake8", "typos" },
				text = { "languagetool" },
				tex = { "lacheck" },
			}

			-- Create autocommand which carries out the actual linting on the specified events
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					-- Only run the linter in buffers that you can modify
					if vim.opt_local.modifiable:get() then
						lint.try_lint()
					end
				end,
			})
		end,
	},

	-- conform
	-- ------------------------------------------
	-- ------------------------------------------
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don"t have a well standardized coding style
				local disable_filetypes = { c = true, cpp = true }
				local lsp_format_opt
				if disable_filetypes[vim.bo[bufnr].filetype] then
					lsp_format_opt = "never"
				else
					lsp_format_opt = "fallback"
				end
				return {
					timeout_ms = 500,
					lsp_format = lsp_format_opt,
				}
			end,
			-- Listed here: https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
			formatters_by_ft = {
				lua = { "stylua" },
				bib = { "bibtex-tidy" },
				python = { "isort", "autopep8" },
				cpp = { "clang-format" },
				tex = { "latexindent" },
				["*"] = { "trim_whitespace" },
			},
		},
	},

	-- cmp
	-- ------------------------------------------
	-- ------------------------------------------
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					return "make install_jsregexp"
				end)(),
				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local fmt = require("luasnip.extras.fmt").fmt
			luasnip.config.setup({})

			-- Custom snippets
			luasnip.add_snippets("all", {
				luasnip.snippet("42", {
					luasnip.insert_node(1),
					luasnip.text_node(" ------------------------------------------"),
				}),
			})
			luasnip.add_snippets("python", {
				luasnip.snippet("main", fmt([[if __name__ == "__main__":]], {})),
				luasnip.snippet(
					"debug",
					fmt(
						[[import ipdb
ipdb.set_trace(context={})]],
						{ luasnip.insert_node(1) }
					)
				),
				luasnip.snippet(
					"log",
					fmt(
						[[from rich.traceback import install
install(show_locals=False, word_wrap=True)
import numpy as np
import torch
np.set_printoptions(precision=3, linewidth=200, suppress=True)
torch.set_printoptions(precision=3, linewidth=200)]],
						{}
					)
				),
				luasnip.snippet(
					"plot",
					fmt(
						[[import matplotlib.pyplot as plt
import numpy as np
def f(x, k): return np.power(x, k)
x = np.linspace(0, 1, 1000)
plt.plot(x, f(x, 2), label="2")
plt.plot(x, f(x, 3), label="3")
plt.legend()
plt.show()]],
						{}
					)
				),
			})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				-- Please read `:help ins-completion`
				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					["<C-n>"] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					["<C-p>"] = cmp.mapping.select_prev_item(),

					-- Scroll the documentation window [b]ack / [f]orward
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					-- More traditional completion keymaps
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),

					-- Manually trigger a completion from nvim-cmp
					["<C-Space>"] = cmp.mapping.complete({}),

					-- <c-l> will move you to the right of each of the expansion locations
					-- <c-h> is similar, except moving you backwards
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{
						-- Set group index to 0 to skip loading LuaLS completions as lazydev recommends it
						name = "lazydev",
						group_index = 0,
					},
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "nvim_lsp_signature_help" },
				},
			})
		end,
	},
})

-- Update modeline
-- vim: ts=4 sts=4 sw=4 et
