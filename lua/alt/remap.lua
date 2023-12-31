vim.g.mapleader = " " --Set The leaderKey

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) --Open Explorer

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") --Move The Selected Code Down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") --Move The Selected Code Up

--PageUp/PageDown 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", [["_dP]]) --Copy/Paste Related 

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) --Copy To Clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) --Copy Only In Within VIM

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) --Replace Words
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) --Make anything executable very useful 
vim.keymap.set("v", "<", "<gv^", opts) --Move Selected To Left
vim.keymap.set("v", ">", ">gv^", opts) --Move Selected To Right

vim.keymap.set("n","<F8>", vim.cmd.ClangFormat) --Clang Formatter 
