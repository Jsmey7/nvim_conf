return {
	"norcalli/nvim-colorizer.lua",
	event = "VimEnter",
	config = function()
		require("colorizer").setup(nil, { css = true })
	end,
}
