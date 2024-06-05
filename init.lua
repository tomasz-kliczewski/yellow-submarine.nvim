local M = {}

local function get_lsp_keywords()
	local clients = vim.lsp.buf_get_clients()
	local keywords = {}

	for _, client in pairs(clients) do
		if client.server_capabilities.completionProvider then
			local items = client.server_capabilities.completionProvider
			if items then
				for _, item in pairs(items) do
					if item.kind == 14 then -- 14 corresponds to "keyword"
						table.insert(keywords, item.label)
					end
				end
			end
		end
	end

	return keywords
end

-- Function to highlight keywords
function M.highlight_keywords()
	local keywords = get_lsp_keywords()

	if #keywords == 0 then
		-- Fallback to default keywords if LSP doesn't provide any
		keywords = {
			"if",
			"else",
			"for",
			"while",
			"return",
			"function",
		}
	end

	-- Create a highlight group for keywords
	vim.cmd("highlight KeywordHighlight ctermfg=Red guifg=Red")

	-- Loop through each keyword and apply the highlight
	for _, keyword in ipairs(keywords) do
		local cmd = string.format("syntax keyword KeywordHighlight %s", keyword)
		vim.cmd(cmd)
	end
end

-- Automatically call the highlight function when entering a buffer
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		M.highlight_keywords()
	end,
})

return M
