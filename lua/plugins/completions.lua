return {
	{
		"hrsh7th/cmp-nvim-lsp"
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies={"nvim-telescope/telescope.nvim"},
		config = function()
			local cmp = require("cmp")
	
			cmp.setup({
				snippet = {
					expand = function(args)
					  require('luasnip').lsp_expand(args.body) -- För snippets
					end,
				},
				mapping = {
					['<Tab>'] = cmp.mapping.select_next_item(),
					['<S-Tab>'] = cmp.mapping.select_prev_item(),
					['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Välj det föreslagna
				},
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' }, -- LSP completion
					{ name = 'luasnip' }, -- Snippets
					{ name = 'nvim_lsp_signature_help' }, -- LSP signature_help
				}, {
					{ name = 'buffer' },
				})
			})

			local on_attach = function(client,bufnr)
				-- vim.keymap.set("n","gd",function()vim.lsp.buf.definition()end,{})
				vim.keymap.set("n","K",function()vim.lsp.buf.hover()end,{})
				vim.keymap.set("n","<leader>vd",function()vim.diagnostic.open_float()end,opts)
				vim.keymap.set("n","<C-k>",function()vim.lsp.buf.signature_help()end,opts)
				vim.keymap.set("i","<C-k>",function()vim.lsp.buf.signature_help()end,opts)
				vim.keymap.set("n","<leader>vca",function()vim.lsp.buf.code_action()end,opts)

				vim.keymap.set("n","gd",require("telescope.builtin").lsp_definitions)
				vim.keymap.set("n","gr",require("telescope.builtin").lsp_references)
				vim.keymap.set("n","<leader>ds",require("telescope.builtin").lsp_document_symbols)
				vim.keymap.set("n","<leader>ws",require("telescope.builtin").lsp_dynamic_workspace_symbols)
				
				-- Not working
				-- vim.keymap.set("n","<leader>rn",function() vim.lsp.buf.rename()end)

				-- Show signature_help all the time
				-- vim.api.nvim_create_autocmd("CursorHoldI", {
				-- 	buffer = bufnr,
				-- 	callback = function()
				-- 	  vim.lsp.buf.signature_help()
				-- 	end,
				-- })
				
				vim.api.nvim_create_autocmd("TextChangedI", {
					buffer = bufnr,
					callback = function()
						vim.diagnostic.setloclist({ open = false }) -- Uppdaterar fel, men öppnar inte fel-listan
					end,
				})
			end

			vim.diagnostic.config({
				virtual_text = true, -- Visa fel som virtuella textrader
				signs = true,        -- Visa tecken i marginalen
				update_in_insert = true, -- Uppdatera diagnostik medan du är i insättningsläge
			  })

			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			require('lspconfig')['ts_ls'].setup {
				capabilities = capabilities,
				on_attach=on_attach
			}
		end
	}
}