vim.opt.nu = true --LineNumbers
vim.opt.relativenumber = true --RelativeLine Numbers

--Tab Spaces
vim.opt.tabstop = 4
vim.opt.softtabstop =4
vim.opt.shiftwidth = 4

vim.opt.smartindent = true --Indentation

--Undo
vim.opt.undodir =os.getenv("HOME")  ..  "/.vim/undodir"
vim.opt.undofile = true

--Search
vim.opt.incsearch = true

--Scrolling 
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50 --updatetime







