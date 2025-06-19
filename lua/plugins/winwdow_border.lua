return {
	"nvim-zh/colorful-winsep.nvim",
	event = { "WinLeave" },
	config = function()
		require("colorful-winsep").setup({
			only_line_seq = false,
			hi = {
				fg = "#FFFFFF",
			},
		})
	end,
}
