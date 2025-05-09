local function command_with_args(prompts, command_template)
	local inputs = {}
	local function ask_next(index)
		if index > #prompts then
			-- All prompts answered, format the command
			local escaped_inputs = vim.tbl_map(function(item)
				return vim.fn.escape(item, " ")
			end, inputs)
			local command = string.format(command_template, unpack(escaped_inputs))
			vim.cmd(command)
			return
		end

		vim.ui.input({ prompt = prompts[index] }, function(input)
			if input then
				table.insert(inputs, input)
				ask_next(index + 1)
			end
		end)
	end

	ask_next(1)
end

return {
	command_with_args = command_with_args,
}
