vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.clipboard = "osc52"

vim.opt.guicursor = ""
vim.opt.termguicolors = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "80"

vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.cursorline = true -- Show which line your cursor is on

vim.o.mouse = "a" -- Enable mouse mode, can be useful for resizing splits for example!
vim.o.showmode = false
vim.g.have_nerd_font = true

vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.confirm = true
vim.o.smartcase = true
vim.o.inccommand = "split"

vim.o.updatetime = 50
vim.o.timeoutlen = 300 -- Decrease mapped sequence wait time

vim.o.splitright = true -- Configure how new splits should be opened
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = "  ", trail = " ", nbsp = " " }
