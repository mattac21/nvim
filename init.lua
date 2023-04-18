require('plugins')
require('nvim-dev')
require('lsp')
require('nvim-cmp')
require('treesitter')
require('nvim-telescope')
require('signs')
require('nnp')
require('blankline')
require('dap-virt-text')
require('go-dap')
require('nvim-dap')
require('scroll-bar')
require('cursor-line')

vim.cmd('source ~/.config/nvim/vs/scroll.vim')
vim.cmd('source ~/.config/nvim/vs/tests.vim')

vim.cmd.colorscheme "moonfly"

vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.o.hlsearch = false
vim.wo.number = true
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.signcolumn = 'yes:1'
vim.opt.wrap = false
vim.opt.guicursor = ""
vim.o.noswapfile = true
vim.o.scrolloff = 8

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

