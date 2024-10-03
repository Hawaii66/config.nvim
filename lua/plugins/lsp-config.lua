return{
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation =true
			})
		end
	},{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			
			lspconfig.ts_ls.setup({})
		end
	}
}