"################################################################################
"#                                                                              #
"# Arquivo de configuracao modificado por : Victor                              #
"#                                                                              #
"# Esse arquivo de configuracao vem por padrao em (~/.vimrc)                    #
"#                                                                              #
"# Ou seja meu link simbolico ficou assim                                       #
"# (ln -s ~/Repos/config-Arch-linux/i3status.conf ~/.vimrc)                     #
"#                                                                              # 
"################################################################################

" Fazendo rodar o pathogen
execute pathogen#infect()
filetype plugin indent on

" Configs de aspectos visuais
colorscheme dracula
syntax on
syntax enable
set showmatch
set number
set relativenumber

" lightline
set noshowmode
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \     'active': {
	  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
      \			'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
      \		}
	  \ }

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" Nerdtree
map <C-o> :NERDTreeToggle<CR>

"impede que o vim execute shellscripts indesejados, modo seguro
set exrc
set secure

" Config do tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

" Colocando os auto complete que estou acostumado
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" arruma o sistema de busca da tecla [/]
set hlsearch
set incsearch
nnoremap <leader><space> :nohlsearch<CR>

" Trabalhando com c puro
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" Trabalhando com latex
autocmd FileType tex  map <C-p> :silent !qpdfview %:r.pdf &<Enter>
autocmd BufWinLeave *.tex silent! execute "!latexmk -c"
autocmd FileType tex  map <C-r> :silent !latexmk -pvc -pdf %:r.tex &<Enter>

