function! s:code2text_complete(...)
  return join(luaeval('require("nvim-code2text.command").command_list()'),"\n")
endfunction

command! -nargs=+ -complete=custom,s:code2text_complete Code2text lua require('nvim-code2text.command').load_command(<f-args>)
