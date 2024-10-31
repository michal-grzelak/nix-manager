-- don't run prettier without .prettier config file in root
vim.g.lazyvim_prettier_needs_config = true

local M = {}

local supported = {
	"css",
	"graphql",
	"handlebars",
	"html",
	"javascript",
	"javascriptreact",
	"json",
	"jsonc",
	"less",
	"markdown",
	"markdown.mdx",
	"scss",
	"typescript",
	"typescriptreact",
	"vue",
	"yaml",
}

local prettier_files = {
	".prettierrc",
	".prettierrc.json",
	".prettierrc.yml",
	".prettierrc.yaml",
	".prettierrc.json5",
	".prettierrc.js",
	".prettierrc.cjs",
	".prettierrc.mjs",
	".prettierrc.toml",
	"prettier.config.js",
	"prettier.config.cjs",
	"prettier.config.mjs",
}
--- Checks if a Prettier config file exists for the given context
---@param ctx ConformCtx
function M.has_config(ctx)
	vim.fn.system({ "prettierd", "--find-config-path", ctx.filename })
	return vim.v.shell_error == 0
end

--- Checks if a parser can be inferred for the given context:
--- * If the filetype is in the supported list, return true
--- * Otherwise, check if a parser can be inferred
---@param ctx ConformCtx
function M.should_run(ctx)
	local ft = vim.bo[ctx.buf].filetype --[[@as string]]
	-- default filetypes are always supported
	if vim.tbl_contains(supported, ft) then
		return true
	end
	-- otherwise, check if a parser can be inferred
	local ret = vim.fn.system({ "prettierd", "--file-info", ctx.filename })
	---@type boolean, string?
	local ok, parser = pcall(function()
		return vim.fn.json_decode(ret).inferredParser
	end)
	return ok and parser and parser ~= vim.NIL
end

M.has_config = LazyVim.memoize(M.has_config)
M.should_run = LazyVim.memoize(M.should_run)

return {
	{
		"williamboman/mason.nvim",
		opts = { ensure_installed = { "prettierd" } },
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		---@class opts ConformOpts
		opts = function(_, opts)
			opts.formatters_by_ft = opts.formatters_by_ft or {}
			for _, ft in ipairs(supported) do
				opts.formatters_by_ft[ft] = { "prettierd" }
			end

			opts.formatters = opts.formatters or {}
			opts.formatters.prettierd = {
				require_cwd = true,
				cwd = require("conform.util").root_file(prettier_files),
				condition = function(_, ctx)
					return M.should_run(ctx) and (vim.g.lazyvim_prettier_needs_config ~= true or M.has_config(ctx))
				end,
			}
		end,
	},

	{
		"nvimtools/none-ls.nvim",
		optional = true,
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.sources = opts.sources or {}
			table.insert(
				opts.sources,
				nls.builtins.formatting.prettierd.with({
					condition = function(utils)
						return utils.root_has_file(prettier_files)
					end,
				})
			)
		end,
	},
}
