-- ~/.config/nvim/lua/my_highlighter/init.lua

local M = {}

-- Define default colors
M.config = {
	keyword_color = "#ff0000",
	comment_color = "#00ff00",
	string_color = "#0000ff",
	background_color = "#000000",
}

-- Setup function to configure user settings
M.setup = function(config)
	M.config = vim.tbl_extend("force", M.config, config or {})
	vim.cmd(
		string.format(
			"highlight MyKeywordHighlight guifg=%s guibg=%s",
			M.config.keyword_color,
			M.config.background_color
		)
	)
	vim.cmd(
		string.format(
			"highlight MyCommentHighlight guifg=%s guibg=%s",
			M.config.comment_color,
			M.config.background_color
		)
	)
	vim.cmd(
		string.format("highlight MyStringHighlight guifg=%s guibg=%s", M.config.string_color, M.config.background_color)
	)
end

-- Function to highlight keywords, comments, and strings
M.highlight = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local params = { textDocument = { uri = vim.uri_from_bufnr(bufnr) } }
	vim.lsp.buf_request(bufnr, "textDocument/documentHighlight", params, function(err, result, ctx, config)
		if err then
			print("Error fetching highlights: ", err)
			return
		end

		if not result or vim.tbl_isempty(result) then
			return
		end

		for _, item in ipairs(result) do
			local hl_group
			if item.kind == 1 then -- TextDocumentHighlightKind.Text
				hl_group = "MyKeywordHighlight"
			elseif item.kind == 2 then -- TextDocumentHighlightKind.Read
				hl_group = "MyCommentHighlight"
			elseif item.kind == 3 then -- TextDocumentHighlightKind.Write
				hl_group = "MyStringHighlight"
			end

			if hl_group then
				local range = item.range
				vim.api.nvim_buf_add_highlight(
					bufnr,
					-1,
					hl_group,
					range.start.line,
					range.start.character,
					range["end"].character
				)
			end
		end
	end)
end

-- Autocommand to highlight on buffer read
vim.api.nvim_command('autocmd BufReadPost,BufNewFile * lua require("my_highlighter").highlight()')

return M
