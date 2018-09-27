syntax on
set bg=dark 
set cursorline
set number
colorscheme gruvbox

nnoremap <F8> :tabn<CR>
nnoremap <F7> :tabp<CR>

" autoformat with Astyle, type 'gqG'
autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ -C\ -Y\ -j\ -J\ -p\ -xC120\ -xL\ -xp\ -k1\ -W1\ --style=google

" Automatically save the current session whenever vim is closed
autocmd VimLeave * mksession! ~/.vim/autosaved_session.vim

" Manually save a session with <F5>
noremap <F5> :mksession! ~/.vim/saved_session.vim<cr>

" <F2> restores that 'saved_session'
noremap <F2> :source ~/.vim/saved_session.vim<cr>

" <F3> restores that 'autosaved_session'
noremap <F3> :source ~/.vim/autosaved_session.vim
