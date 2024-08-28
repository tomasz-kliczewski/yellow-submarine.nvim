local c = require("yellowsub.palette")

local hl = vim.api.nvim_set_hl
local theme = {}

theme.set_highlights = function()
	-- highlights
	hl(0, "Normal", { fg = c.fg, bg = c.bg })
	hl(0, "NormalFloat", { fg = c.fg, bg = c.bg_darker })
	hl(0, "FloatBorder", { fg = c.fg, bg = c.bg })
	hl(0, "NormalNC", { fg = c.fg, bg = c.bg }) -- Normal non current
	hl(0, "NormalSB", { fg = c.fg, bg = c.bg_darker }) -- Normal text in side bar
	hl(0, "Pmenu", { fg = c.fg, bg = c.bg_darker })
	hl(0, "SignColumn", { fg = "NONE", bg = c.bg })
	hl(0, "CursorLineNr", { fg = c.gold, bg = "NONE", bold = true })
	hl(0, "Statement", { fg = c.fg, bg = "NONE", bold = true })
	hl(0, "TelescopeSelection", { fg = c.fg, bg = c.slitegrey, italic = true })
	hl(0, "CursorLine", { fg = "NONE", bg = c.grey, italic = true })
	hl(0, "StatusLine", { fg = c.fg, bg = c.grey, italic = true })

	-- special words
	hl(0, "Comment", { fg = c.peru, bg = "NONE" })
	hl(0, "Special", { fg = c.fg, bg = "NONE", bold = true })
	hl(0, "@variable", { fg = c.fg, bg = "NONE" })
	hl(0, "Constant", { fg = c.fg, bg = "NONE" })
	hl(0, "Function", { fg = c.white, bg = "NONE" })
	hl(0, "String", { fg = c.limegreen, bg = "NONE" })
	hl(0, "Identifier", { fg = c.fg, bg = "NONE" })
	hl(0, "Title", { fg = c.gold, bg = "NONE", bold = true })
	hl(0, "Type", { fg = c.fg, bg = "NONE", bold = true })

hl(0,"Conditional", { fg = c.fg, bg="NONE" })
hl(0,"Repeat", { fg = c.fg, bg="NONE" })
hl(0,"Label", { fg = c.fg})
hl(0,"Keyword", { fg = c.gold, bg="NONE" })
hl(0,"Exception", { fg = c.fg, bg="NONE" })
hl(0,"PreProc", { fg = c.fg, bg="NONE" })
hl(0,"Include", { fg = c.fg, bg="NONE" })
hl(0,"Define", { fg = c.fg, bg="NONE" })
hl(0,"Macro", { fg = c.fg, bg="NONE" })
hl(0,"PreCondit", { fg = c.fg, bg="NONE" })
hl(0,"StorageClass", { fg = c.fg, bg="NONE" })
hl(0,"Structure", { fg = c.fg})
hl(0,"Typedef", { fg = c.fg })

	-- diagnostics
	hl(0, "DiagnosticError", { fg = c.red, bg = "NONE", bold = true })
	hl(0, "DiagnosticWarn", { fg = c.gold, bg = "NONE", bold = true })
	hl(0, "DiagnosticHint", { fg = c.cyan, bg = "NONE", bold = true })
end

return theme
