local utils = require("nvim-code2text.utils")
-- Language selected once enterCode is called
local languageSelected = ""
-- Languages available
local languagesAvailable = { "python", "bash", "javascript" }
-- Needed binaries from each language
local languagesExecutable = {
	python = "python3",
	bash = "bash",
	javascript = "node",
}
-- Output from code (stdout)
local resultText = ""
-- Original window in which enterCode has been called
local currentWindow = nil
-- Splitted buffer created when enterCode is called
local newBuf = nil

local function enterCode(language)
	if not utils.contains(languagesAvailable, language) then
		print("Language not supported")
	elseif not utils.program_exists(languagesExecutable[language]) then
		print("Interpreter not installed: " .. languagesExecutable[language])
	else
		currentWindow = vim.api.nvim_get_current_win()
		languageSelected = language

		vim.api.nvim_command("botright vsplit")
		local splittedWindow = vim.api.nvim_get_current_win()

		if newBuf == nil then
			newBuf = vim.api.nvim_create_buf(true, true)
		end

		if language == nil then
			vim.api.nvim_buf_set_name(newBuf, "Code2Text")
		else
			vim.api.nvim_buf_set_name(newBuf, "Code2Text")
		end

		vim.api.nvim_buf_set_option(newBuf, "filetype", languageSelected)
		vim.api.nvim_buf_set_option(newBuf, "swapfile", false)

		vim.api.nvim_win_set_buf(splittedWindow, newBuf)
	end
end

local function getOutput()
	resultText = vim.api.nvim_exec("w !" .. languagesExecutable[languageSelected], true)
	print(resultText)
end

local function getCurrentLine(window)
	vim.api.nvim_set_current_win(window)
	return vim.api.nvim_exec('echo line(".")', true)
end

local function acceptOutput()
	resultText = vim.api.nvim_exec("w !" .. languagesExecutable[languageSelected], true)
	vim.api.nvim_command("q")
	currentLine = getCurrentLine(currentWindow)
	currentLine = tonumber(currentLine)
	-- Taken from https://gist.github.com/iwanbk/5479582
	for line in resultText:gmatch("([^\n]*)\n?") do
		if line ~= "" then
			vim.api.nvim_command("put='" .. line .. "'")
		end
	end
end

return {
	enterCode = enterCode,
	getOutput = getOutput,
	acceptOutput = acceptOutput,
}
