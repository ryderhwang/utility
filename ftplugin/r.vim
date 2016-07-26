"-------------------------------------------------------------------------------
" Autocommands
"-------------------------------------------------------------------------------
autocmd FileType cpp setlocal foldmethod=syntax

autocmd FileType r nnoremap <buffer> <F9> :call <SID>compileAndRun()<cr>
autocmd FileType r inoremap <buffer> { {}<esc>i<cr><esc>O

autocmd FileType r iabbrev #-- #-------------------------------------------------------------------------------<cr>#<cr>#-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" Function Definition
"-------------------------------------------------------------------------------
func! s:compileAndRun()
	exec "w"
	exec "!R --slave -f %"
endfunc
