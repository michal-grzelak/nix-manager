return {
	-- debugger adapter
	{ import = "lazyvim.plugins.extras.dap.core" },

	-- test interaction framework
	{ import = "lazyvim.plugins.extras.test.core" },

	-- add neotest adapters
	{
		"nvim-neotest/neotest",
		opts = {
			["neotest-jest"] = {},
			["neotest-vitest"] = {},
			["neotest-playwright"] = {},
			["neotest-deno"] = {},
		},
	},
}
