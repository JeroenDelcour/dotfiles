execute pathogen#infect()

" Don't pretend to be Vi
set nocompatible

" enable syntax highlighting and plugins (for netrw)
syntax on
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Colorscheme
set t_Co=256
colorscheme default

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=1

" Start in pencil mode when opening text or markdown files
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" When entering Goyo, change colorscheme and remove tmux bar
function! s:goyo_enter()
    colorscheme pencil
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
endfunction

function! s:goyo_leave()
    colorscheme default
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Heavily inspired by (i.e. pretty much straight copied from)
" Max Cantor's talk (https://www.youtube.com/watch?v=XA2WjJbmmoM)
" https://github.com/mcantor/no_plugins

" FINDING FILES
" -------------
" Out-of-the-box:
" - Use :find with tab-completion out of the box
" - Use * (wildcard) to make it (sorta) fuzzy
" - :b lets you fuzzy find open buffers

" Search down into subfolders
set path+=**
" Display all matching files when we tab complete
set wildmenu


" AUTOCOMPLETE
" ------------
" Actually works great out of the box!
" - C-n and C-p for JUST this file
" - C-x C-f for filenames (scroll through with C-n and C-p)

" FILE BROWSING
" -------------
" Use :edit on a folder to enter the netrw file browser
" - Enter to open a folder/file
" - t to open in a new tab
" - v to split visually
" - :bd to exit
" Still a little confusing to me.
" I should probably get more comfortable
" with buffers, windows, and tab.

" Tweaks
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1  	    " open splits vertically
let g:netrw_liststyle=3	    " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOT INCLUDED
" ------------
" Tag jumping: e.g. jump to class definition
