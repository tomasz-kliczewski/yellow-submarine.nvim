local c = require("ring0dark.palette")

local hl = vim.api.nvim_set_hl
local theme = {}

theme.set_highlights = function()
	-- highlights
	hl(0, "Normal", { fg = c.fg, bg = c.bg })
	hl(0, "SignColumn", { fg = "NONE", bg = c.bg })
	hl(0, "MsgArea", { fg = c.fg, bg = c.bg })
	hl(0, "ModeMsg", { fg = c.fg, bg = c.bg })
	hl(0, "MsgSeparator", { fg = c.fg, bg = c.bg })
	hl(0, "NormalNC", { fg = c.fg, bg = c.bg })
	hl(0, "CursorLineNr", { fg = c.yellow, bg = "NONE", bold = true })
	hl(0, "Comment", { fg = c.brown, bg = "NONE", italic = true })
	hl(0, "Identifier", { fg = c.fg, bg = "NONE", italic = true })
	hl(0, "Statement", { fg = c.yellow, bg = "NONE", bold = true })
end

return theme
