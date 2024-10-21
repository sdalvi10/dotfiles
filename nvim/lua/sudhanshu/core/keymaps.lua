vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit [V]ertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit [H]orizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "[S]plit [E]qualize" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "[T]ab [O]pen" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "[T]ab [C]lose" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "[T]ab [N]ext" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "[T]ab [P]revious" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- center view when moving half page up or down
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- center view when moving to next search item
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- compile LaTeX file
-- keymap.set("n", "<leader>c", ":w<CR>:!pdflatex %<CR>", { desc = "[C]ompile LaTeX file" })

keymap.set("n", "<leader>ya", ":%y+<CR>", { desc = "[Y]ank [A]ll" }) -- copy entire file
keymap.set("n", "<leader>yw", 'viw"+y', { desc = "[Y]ank [W]ord to system clipboard" }) -- copy to system clipboard
keymap.set("v", "<leader>y", '"+y', { desc = "[Y]ank selection" }) -- copy to system clipboard

-- center view when going to a definition
-- keymap.set("n", "gd", "gdzz")

-- create a new line above or below the cursor while staying in normal mode
keymap.set("n", "<CR>", "m`o<Esc>``", { desc = "Create a new line below the cursor and stay in normal mode" })
keymap.set("n", "<S-CR>", "m`O<Esc>``", { desc = "Create a new line above the cursor and stay in normal mode" })
