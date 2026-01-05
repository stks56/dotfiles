" Leader key configuration
let mapleader = " "

" Redo reverse u
nnoremap <silent> U <c-r>

" Clear Slash Search (alternative binding)
nnoremap <silent> <c-r> :nohlsearch<CR>

" x to blackhole register
nnoremap <silent> x "_d
nnoremap <silent> xx "_dd
nnoremap <silent> X "_D
xnoremap <silent> x "_x
onoremap x d

" select inner word on space
onoremap <silent> i<space> iW
xnoremap i<space> iW
