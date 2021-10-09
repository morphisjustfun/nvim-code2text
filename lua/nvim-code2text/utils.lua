-- Taken and modified from https://github.com/morphisjustfun/DAPInstall.nvim

local function return_exe(cmd)
	local handle = assert(io.popen(cmd, "r"))
	local output = assert(handle:read("*a"))

	local stringLength = string.len(output)
	handle:close()

	return stringLength
end

local function program_exists(program)
	local returnExe = return_exe("command -v " .. program)
	if returnExe == 0 then
		return false
	end
	return true
end

-- Taken from https://programming-idioms.org/idiom/12/check-if-list-contains-a-value/4606/lua

local function contains(list, x)
	for _, v in pairs(list) do
		if v == x then
			return true
		end
	end
	return false
end

local utils = {
	return_exe = return_exe,
	program_exists = program_exists,
	contains = contains,
}

return utils
