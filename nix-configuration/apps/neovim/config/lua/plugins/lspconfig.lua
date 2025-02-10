return {
	"neovim/nvim-lspconfig",
	---@class PluginLspOpts
	opts = {
		---@type vim.diagnostic.Opts
		diagnostics = {
			update_in_insert = true,
		},
	},
}
