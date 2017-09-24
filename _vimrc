source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

:let g:session_autosave = 'no'
:let g:session_autoload = 'no'
set guifont=Consolas:h10
execute pathogen#infect()
execute pathogen#helptags()
syntax on
set virtualedit=all
set smartindent
set hidden


"function! CSyntaxAfter()
"	syntax keyword Boolean true false NULL TRUE FALSE
"        syntax keyword Statement namespace stderr stdin stdout new this delete
"
"	syntax match _Block "[{}]"
"	syntax match _Bracket "[\[\]]"
"	syntax match _Operator "[-+&|<>=!\/~.,;:*%&^?()]"
"	syntax region _Comment start="\/\*" end="\*\/"
"	syntax match _Comment "\/\/.*$"
"
"	hi _Block guifg=yellow1 guibg=NONE gui=none
"	hi link _Bracket Constant
"	hi link _Operator Operator
"	hi link _Comment Comment
"endfunction

"autocmd! FileType c,cpp,java,php call CSyntaxAfter() 

"autocmd FileType java setlocal omnifunc=javacomplete#Complete
colorscheme vim-material
set noundofile
set nobackup
set nowritebackup

set number
map f <Plug>(easymotion-f)
map F <Plug>(easymotion-F)
map B :b#<CR>
unmap <C-Y>
map <C-T> :NERDTreeToggle<CR>
