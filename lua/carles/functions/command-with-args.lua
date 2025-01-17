local function command_with_args(prompt_text, command_template)
	vim.ui.input({ prompt = prompt_text }, function(input)
		if input then
			local command = string.format(command_template, vim.fn.escape(input, " "))
			vim.cmd(command)
		end
	end)
end

return {
	command_with_args = command_with_args,
}
