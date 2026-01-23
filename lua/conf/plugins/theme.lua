return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("gruvbox").setup({
				styles = {
					comments = { italic = false },
				},
			})

			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
