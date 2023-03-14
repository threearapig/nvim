<!-- TOC GFM -->

* [基础设置](#基础设置)
    - [选项设置](#选项设置)
    - [按键映射](#按键映射)
        + [关于按键映射](#关于按键映射)
        + [基础映射](#基础映射)
        + [光标移动](#光标移动)
        + [分屏操作](#分屏操作)
        + [多窗口](#多窗口)

<!-- /TOC -->
## 基础设置


### 选项设置

> 选项就相当于 vim 的属性
>
> `set number` 	==	 `set shownumber = true`
>
> `set nonumber` ==	 `set shownumber = false`
>
> 所以如果想要取消某个选项的功能，只需要在选项前加上 `no` 即可

```vim
" ==================== 基本选项 ====================
filetype plugin indent on               " 打开文件类型检测功能
syntax on                               " 开启语法高亮
let mapleader=" "                       " 将 leader 键改为空格
let &t_ut=''                            " 防止有些终端进入vim时配色有误
set encoding=utf-8                      " 指定vim内部使用的编码方式为utf-8
set showcmd                             " 大致在右下角显示部分正在或刚刚的操作
set autochdir                           " 根据当前窗口的文件自动切换工作目录
set number                              " 行前显示行号
set relativenumber                      " 显示相对行号
set cursorline                          " 高亮光标所在行（在不同的配色方案中会有不同的效果，但是没有配色方案时，只会显示一条线）
set expandtab                           " 键入 <TAB> 时使用空格代替制表符
set tabstop=4                           " <TAB> 在文件里使用的空格数
set softtabstop=4                       " 编辑时 <TAB> 使用的空格数
set shiftwidth=4                        " （自动）缩进时补出的空格数
set autoindent                          " 根据上一行决定新行的缩进
set list                                " 显示 <TAB> 和 <EOL>
set listchars=tab:\|\ ,trail:▫          " <TAB> 使用 \|\ 显示，<EOL> 使用 ▫ 显示
set scrolloff=5                         " 光标上下的最小行数
set ttimeoutlen=0                       " 键盘代码超时时间
set notimeout                           " 映射和键盘代码不等待超时
set viewoptions=cursor,folds,slash,unix " 指定 :mkview 保存的内容
set wrap                                " 使字数过多的行不会超出屏幕，会在下一行继续显示，并且还属于同一行
set textwidth=0                         " 插入文本的最大宽度，0表示关闭此功能，不关闭超过最大宽度就会自动按下回车自动换行
set indentexpr=                         " 根据表达式来计算缩进，该选项为空时，优先于其他选项覆盖
set foldmethod=indent                   " 代码折叠的类型
set foldlevel=99                        " 当折叠级别高于99时关闭折叠
set foldenable                          " 启动折叠
set formatoptions-=tc                   " 自动排版完成的方式
set splitright                          " 分割窗口时新窗口在当前窗口的右侧
set splitbelow                          " 分割窗口时新窗口在当前窗口的下面
set noshowmode                          " 不在状态行上显示当前模式
set ignorecase                          " 搜索模式时忽略大小写
set smartcase                           " 模式中有大写字母时不忽略大小写
set shortmess+=c                        " 缩短消息长度的标志位列表
set inccommand=split                    " 命令的更改会在preview中显示（nvim所支持）
set completeopt=longest,noinsert,menuone,noselect,preview   " 插入模式补全使用的选项
set lazyredraw                          " 执行宏时不重画
set visualbell                          " 使用可视铃声而不是响铃
set updatetime=100                      " 刷新交换文件所需要的毫秒数
set signcolumn=yes                      " 显示左侧图标指示列（这里用与标示git状态）
set virtualedit=block                   " 何时使用虚拟编辑
set backspace=indent,eol,start          " 在行首按退格键时能回到上一行的行尾
set laststatus=2                        " 总是显示状态栏（0：不显示状态栏，1：只在多窗口时显示状态栏）
set wildmenu                            " vim命令模式下自带补全，此选项为自动补全实现可选菜单
set hlsearch                            " 高亮匹配搜索
set incsearch                           " 边输入边高亮搜索
set mouse=                              " 禁用鼠标

" 每次vim在加载文件时，都执行:nohlsearch命令，关闭此次高亮
exec "nohlsearch"
```

> `filetype plugin indent on` 为下面3条命令的简写
>
> * filetype on								" 检测文件类型
> * filetype indent on					" 针对不同的文件类型采用不同的缩进格式
> * filetype plugin on					" 加载文件类型对应的插件

> `set formatoptions-=tc` 自动排版完成的方式
>
> * t：根据 textwidth 自动折行
> * c：在（程序源代码中的）注释中自动折行，插入合适的注释起始字符

> `set mouse=a`：允许vim使用鼠标（一般不建议使用）

> " set nocompatible						" 不兼容vi的功能和设置（兼容的话，有些插件可能会有问题）
>
> nvim本身就不兼容vi，所以没有这个选项
>
> 但是使用vim时，需要开启



**不同模式有不同的光标样式**

```vim
" 不同模式有不同的光标样式
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
```



**每次进入文件，光标都会回到上一次的位置**

```vim
" 每次进入文件，光标都会回到上一次的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
```



**终端颜色显示**

> 当为Vim编辑器安装一些主题时，有的主题是需要启用256-Color和True-Color支持才能正常显示使用！
>
> - 256-color又名8-bit color，最大支持2的8次方种颜色
> - true-color又名24-bit color，最大支持2的24次方种颜色（真彩色）

```vim
" 使用256-Color（t_Co即terminal Color）
set t_Co=256
" 使用True-Color
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" 开启nvim的True-Color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
```


---



### 按键映射

> 适用于 **colemak** 键盘布局


#### 关于按键映射

> `<silent>` 表示静默映射，不会显示Vim在处理rhs过程中对界面产生的变化
>
> * 比如在Normal模式下定义了`nmap <c-s> :write<cr>` ，按下`<c-s>` 后可以看到界面底部显示有`write` 的字样，但如果在`<c-s>` 前面加了`<silent>` ，则不会显示


**不同方式的键盘映射**

**map** 和 **noremap** 的区别：

map 为递归映射

noremap 为非递归映射

```vim
:map j gg
:map Q j
:noremap W j
```

* 第一行：`j` 将会被映射为 `gg`
* 第二行：`Q` 将会被映射为 `gg` ，这就是递归映射（即，`Q` —> `j` —> `gg`）
* 第三行：`W` 将会被映射为 `j`，因为是非递归


---


**不同模式下的键盘映射**

键盘映射大致分为两大项：**map** 和 **noremap**

其中又分为模式下的映射：

* **c[map/noremap]**：映射仅作用于命令行模式
* **i[map/noremap]**：映射仅作用于插入模式
* **n[map/noremap]**：映射仅作用于普通模式
* **v[map/noremap]**：映射仅作用于可视模式
* **o[map/noremap]**：映射仅作用于操作符带决模式
* **[map/noremap]**：映射仅作用于普通及可视模式

> 其他的关于 `unmap`、`mapc` 等（不常用），但模式映射效果同上


---



#### 基础映射


**快捷保存退出**

> `<CR>` 表示按下回车键

> `:so %` 用于刷新当前文件

```vim
noremap ; :
noremap S :w<CR>
noremap Q :q<CR>
```



**进入插入模式**

> 由于原插入键 `i` 已应用于左移，所以将 `k` 映射为进入插入模式

```vim
noremap k i
noremap K I
```



**撤销**

> 由于原撤销键 `u` 已应用于上移，所以将 `l` 映射为撤销

```vim
noremap l u
```



**搜索**

> 由于标准的是使用 `n` 和 `N` 来向下和向上搜索
>
> 但是 `n` 已经被用来当作右移
>
> `zz` 用于将光标行移至屏幕中间

```vim
noremap = nzz
noremap - Nzz
```

```vim
" 关闭当前高亮
noremap <LEADER><CR> :nohlsearch<CR>
```



**其他实用映射**

```vim
" 将选中文本拷贝到系统剪切板
vnoremap Y "+y
" 添加 {} 并进入 {} 内编辑
inoremap <c-y> <ESC>A<CR>{}<ESC>i<CR><ESC>ko
" 启用/关闭代码折叠
noremap <silent> <LEADER>o za
" 将光标所在字母进行大小写转换
noremap ` ~
" 将光标所在行移至屏幕中间
noremap <C-c> zz
" 按两下空格键跳转到下一个'<++>'，并编辑它
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>"_c4l
" Spelling Check with <space>sc
" 开启/关闭拼写检查
noremap <LEADER>sc :set spell!<CR>
" 开启/关闭wrap
noremap <LEADER>sw :set wrap!<CR>
```


---



#### 光标移动


**普通模式下**

```vim
"     ^
"     u
" < n   i >
"     e
"     v
noremap <silent> u k
noremap <silent> e j
noremap <silent> n h
noremap <silent> i l
```

```vim
" 上下移动时，几行几行的移动
noremap <silent> U 5k
noremap <silent> E 5j
" 光标快速移动到行首和行尾
noremap <silent> N 0
noremap <silent> I $
" 当开启 wrap 选项时，gk、gj 可以在一行中上下移动
noremap <silent> gu gk
noremap <silent> ge gj
```

```vim
" w：移动到下一个单词的首字母
" b：移动到单词的行首，之后就是移动到上一个单词的行首
noremap W 5w
noremap B 5b
" e：移动到单词的行尾，之后就是移动到下一个单词的行尾
noremap h e
```

```vim
" 向上/向下移动，但是光标不移动，只是视角部分移动
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>
```

```vim
" 进入可视模式，并从当前位置选中到一行的最后
noremap <silent> \v v$h
```


**插入模式下**

```vim
" 移动到行尾
inoremap <C-a> <ESC>A
```


**命令行模式下**

```vim
" <M-其他键>:表示按住Alt键+其他键
" 向上移动
cnoremap <M-u> <Up>
" 向下移动
cnoremap <M-e> <Down>
" 向左移动
cnoremap <M-n> <Left>
" 向右移动
cnoremap <M-i> <Right>
" 移动到行首
cnoremap <M-k> <S-Left>
" 移动到行尾
cnoremap <M-a> <S-Right>
```


---



#### 分屏操作

> 将 `s` 映射为 `<nop>` 的目的是让其作为激活操作符带决模式的按键
>
> `<nop>` (no operation) 表示不做任何操作

```vim
" 将 s 映射为不做任何操作
noremap s <nop>
```

> 光标与分屏方向一致

```vim
" 向上分屏
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
" 向下分屏
noremap se :set splitbelow<CR>:split<CR>
" 向左分屏
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
" 向右分屏
noremap si :set splitright<CR>:vsplit<CR>
```

```vim
" 切换到下一个窗口 
noremap <LEADER>w <C-w>w
" 光标往上移动一个窗口
noremap <leader>u <c-w>k
" 光标往下移动一个窗口
noremap <leader>e <c-w>j
" 光标往左移动一个窗口
noremap <leader>n <c-w>h
" 光标往右移动一个窗口
noremap <leader>i <c-w>l
```

```vim
" 改变上下分屏大小
noremap <up> :res +5<CR>
" 改变上下分屏大小
noremap <down> :res -5<CR>
" 改变左右分屏大小
noremap <left> :vertical resize-5<CR>
" 改变左右分屏大小
noremap <right> :vertical resize+5<CR>
```

```vim
" 切换为上下分屏
noremap sh <C-w>t<C-w>K
" 切换为左右分屏
noremap sv <C-w>t<C-w>H
```

```vim
" 以堆栈的方式旋转屏幕，类似dwm
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H
```

```vim
" 将光标所在的窗口删除，但是保留被删除窗口的 buffer
noremap <LEADER>q <C-w>j:q<CR>
" 将光标所在窗口的下一个窗口删除，但是保留被删除窗口的 buffer
noremap qf <C-w>o
```



---



#### 多窗口

```vim
" 创建一个新的Tab，并将光标移动到这个新Tab
noremap tu :tabe<CR>
" 创建一个新的Tab，并引用刚刚的buffer,并且光标也是移动到这个新Tab
noremap tU :tab split<CR>
```

```vim
" 在Tab间左右移动
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
```

```vim
" 移动当前Tab的左右位置，也可以理解为翻转堆栈
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>
```
