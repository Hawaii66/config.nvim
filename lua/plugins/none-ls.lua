return {
	"nvimtools/none-ls.nvim",
	dependencies={
		"nvimtools/none-ls-extras.nvim"
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources={
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				require("none-ls.diagnostics.eslint_d")
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							vim.lsp.buf.formatting_sync()
						end,
					})
				end
			end,
		})

		vim.keymap.set("n","<leader>gf",vim.lsp.buf.format,{})
	end
}