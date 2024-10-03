return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies={
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim"
	},
	config = function()
		vim.keymap.set("n","<C-b>",":Neotree filesystem reveal left toggle<CR>",{})
	end
}