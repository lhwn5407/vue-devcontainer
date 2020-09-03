"""
""" Subject    : 범용으로 적합한 vim 설정과 그 한글 설명
""" Created at : 2020-08-23
""" Author     : 이형욱
"""



"""
""" 기본 설정
"""
set nocompatible        "VI 호환모드 비활성화
set history=200         "최근 200명령어 저장
syntax   on             "구문 강조 활성화
filetype on             "파일 종류에 따른 구문 강조
filetype plugin on
filetype indent on      "파일 종류에 따른 탭 간격 조정
set ttimeout            "key code에 대한 타임아웃 설정
set ttimeoutlen=100     "Esc 키 이후 특별명령에 대해 100ms 대기


"""
""" UI 설정
"""
set scrolloff=10        "스크롤 시 위 아래 여백
"set lazyredraw          "Macro 사용중에 화면을 다시 그리지 않음
set wildmenu            "자동완성 표시
set display=truncate    "행이 너무 길어서 생략됐을때 @@@ 표시

"set laststatus=2        "상태 표시줄 항상 표시
set title               "타이틀 바에 현재 편집중인 파일 표시
set ruler               "현재 커서 위치를 화면 우측 하단에 표시
"set cursorline          "현재 라인 강조
set number              "줄 번호 표시
"highlight LineNr ctermfg=black ctermbg=DarkGray
"highlight CursorLineNr ctermfg=DarkGray ctermbg=black
"set numberwidth=8       "줄 번호 너비

set nowrapscan          "검색할 때 문서를 순환하지 않음
set hlsearch            "검색어 강조
set showmatch           "괄호 짝 강조

set showmode            "모드 변환시 화면에 표시
set showcmd             "입력 명령 표시


"""
""" 텍스트 포매팅 / 레이아웃
"""
set tabstop=4           "파일의 tab을 스페이스 몇 개로 보여주는지 설정
set softtabstop=4       "expandtab가 설정돼 있을시 텍스트 편집 중에 tab키로 입력될 스페이스의 수를 지정
set shiftwidth=4        "<<,>> 와 자동 들여쓰기의 스페이스 수를 지정
set expandtab           "탭 대신 스페이스 입력 - 입력하는 스페이스의 수는 softtabstop에서 지정한 값이다
set smarttab            "shiftwidth, tabstop, softtabstop을 참조하여, 탭과 백 스페이스 키의 동작을 보조한다

set autoindent          "자동 들여쓰기 - Enter 입력시 기존 행의 들여쓰기를 다음 행에 적용한다.
set smartindent         "구문인식 들여쓰기 - 편집하고 있는 코드의 문법/스타일에 따라 들여쓰기를 적용한다
set cindent             "C언어 스타일의 들여쓰기

"set nowrap             "자동 줄바꿈 안함
set ignorecase          "검색시 대소문자 무시
set smartcase           "검색어에 대문자 포함시 대소문자를 무시하지 않는다 - ignorecase가 설정되어 있어야 함
" 
" 백 스페이스가 지울 수 있는 것과 없는 것을 설정한다
" indent : 오토 인덴트를 지울 수 있다. 만약 인덴팅에 4개의 스페이스를 사용하고
"          있다면, 백스페이스를 한 번 눌러서 인덴팅의 스페이스를 4개 지울 수 있다.
" eol    : end of line을 지워서 두 줄을 하나로 합칠 수 있다.
" start  : 행의 시작 지점을 지울 수 있다.
" 
" eol과 start를 함께 설정하면 백스페이스로 이번 줄을 다 지우고 나서 더 누르면
" 바로 윗줄 제일 오른쪽 글자부터 지우기 시작한다.
"
set backspace=indent,eol,start 


"""
""" 고급 설정
""" 

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

" Put these in an autocmd group, so that you can revert them with:
" ":augroup vimStartup | au! | augroup END"
augroup vimStartup
au!

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif
