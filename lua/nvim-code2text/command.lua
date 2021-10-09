-- Adapted from https://github.com/glepnir/lspsaga.nvim/blob/main/lua/lspsaga/command.lua
--
local function enterCodeBash()
	require("nvim-code2text").enterCode("bash")
end

local function enterCodePython()
	require("nvim-code2text").enterCode("python")
end

local function enterCodeJavascript()
	require("nvim-code2text").enterCode("javascript")
end

local subcommands = {
	bash = enterCodeBash,
	python = enterCodePython,
	javascript = enterCodeJavascript,
}

local function command_list()
	return vim.tbl_keys(subcommands)
end

local function load_command(cmd, ...)
	local args = { ... }
	if next(args) ~= nil then
		subcommands[cmd](args[1])
	else
		subcommands[cmd]()
	end
end

return {
	subcommands = subcommands,
	command_list = command_list,
	load_command = load_command,
}
