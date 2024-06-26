local opt = vim.opt 


opt.guifont = "VictorMono:h12"

--line numbers
opt.relativenumber = true
opt.number = true

opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true 
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.splitright = true
opt.splitbelow = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 4
opt.updatetime = 50
opt.colorcolumn = "80"

vim.g.mapleader = " "

