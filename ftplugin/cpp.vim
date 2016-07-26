"-------------------------------------------------------------------------------
" Autocommands
"-------------------------------------------------------------------------------
autocmd FileType cpp setlocal foldmethod=syntax

autocmd FileType cpp nnoremap <buffer> <space>          :e %:t:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>
autocmd FileType cpp nnoremap <buffer> <localleader>sp  :sp %:t:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>
autocmd FileType cpp nnoremap <buffer> <localleader>vsp :vsp %:t:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>
autocmd FileType cpp nnoremap <buffer> <localleader>vf  V/{<cr>%

autocmd FileType cpp inoremap <buffer> { {}<esc>i<cr><esc>O
