"################################################################################
"#                                                                              #
"# Arquivo de configuracao modificado por : Victor                              #
"#                                                                              #
"# Esse arquivo de configuracao vem por padrao em (~/.vimrc)                    #
"#                                                                              #
"# Ou seja meu link simbolico ficou assim                                       #
"# (ln -s ~/Repos/config-Arch-linux/.vimrc ~/.vimrc)							              #
"#                                                                              # 
"################################################################################

" Fazendo rodar o pathogen
execute pathogen#infect()
filetype plugin indent on

" ########### Os meus plugins ########### 

" lightline
set noshowmode
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \     'active': {
			\     'left' : [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
      \			'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
      \		}
	  \ }

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers =  {
  \ 'c' : ['re!\w{2}'],
  \ 'cpp' : ['re!\w{2}'],
  \ 'python' : ['re!\w{2}'],
  \ }

" Verificador de erros c/c++ syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Latex live Preview
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 1

" Criando snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" ########### Configs do vim puro ########### 

" Trabalhando com latex
"autocmd FileType tex  map <C-p> :silent !qpdfview %:r.pdf &<Enter>
"autocmd FileType tex  map <C-p> :silent !evince %:r.pdf &<Enter>
"autocmd FileType tex  map <C-r> :silent !latexmk -pvc -pdf %:r.tex &<Enter>
"autocmd FileType tex  map <C-r> :silent !pdflatex %:r.tex &<Enter>
autocmd BufWinLeave *.tex silent! execute "!latexmk -c"
" Preview no latex 
autocmd FileType tex nmap <F6> :LLPStartPreview <CR> 

" Colocando os auto complete que estou acostumado
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Config do tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

"impede que o vim execute shellscripts indesejados, modo seguro
set exrc
set secure

" Configs de aspectos visuais
color abbott
"color spacecamp_lite
"color dracula
"color space-vim-dark
"color aprendice
syntax on
syntax enable
set showmatch
set number
set relativenumber

" arruma o sistema de busca da tecla [/]
set hlsearch
set incsearch
nnoremap <leader><space> :nohlsearch<CR>

" Arrumando a path
set path=$PWD/**

" Compilar em c
autocmd FileType c map <F6> :silent !gcc %:r.c -o %:r -lm &<Enter>
autocmd FileType cpp map <F6> :silent !g++ %:r.c -o %:r &<Enter>
