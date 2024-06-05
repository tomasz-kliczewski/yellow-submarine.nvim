local M = {}

-- Define default colors
M.config = {
	keyword_color = "KeywordHighlight",
	comment_color = "CommentHighlight",
	string_color = "StringHighlight",
}

-- Setup function to configure user settings
M.setup = function(config)
	M.config = vim.tbl_extend("force", M.config, config or {})
	vim.cmd(string.format("highlight %s guifg=#ff0000", M.config.keyword_color))
	vim.cmd(string.format("highlight %s guifg=#00ff00", M.config.comment_color))
	vim.cmd(string.format("highlight %s guifg=#0000ff", M.config.string_color))
end

-- Function to highlight keywords, comments, and strings
M.highlight = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local params = { textDocument = { uri = vim.uri_from_bufnr(bufnr) } }
	vim.lsp.buf_request(bufnr, "textDocument/syntaxHighlight", params, function(err, result, ctx, config)
		if err then
			print("Error fetching highlights: ", err)
			return
		end

		if not result or vim.tbl_isempty(result) then
			return
		end

		for _, item in ipairs(result) do
			local hl_group
			if item.kind == "keyword" then
				hl_group = M.config.keyword_color
			elseif item.kind == "comment" then
				hl_group = M.config.comment_color
			elseif item.kind == "string" then
				hl_group = M.config.string_color
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
vim.api.nvim_command('autocmd BufReadPost,BufNewFile * lua require("ring0-dark").highlight()')

return M
