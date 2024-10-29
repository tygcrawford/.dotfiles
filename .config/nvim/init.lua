require("kickstart")

vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.keymap.set("n", "<CR>j", "o<Esc>k", { desc = "Create empty line above" })
vim.keymap.set("n", "<CR>k", "O<Esc>j", { desc = "Create empty line below" })

vim.filetype.add({
	extension = {
		zsh = "sh",
		sh = "sh",
	},
	filename = {
		[".zshrc"] = "sh",
		[".zshenv"] = "sh",
	},
})
