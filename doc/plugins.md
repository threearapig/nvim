<!-- TOC GFM -->

* [vim-plug](#vim-plug)
    - [常用插件](#常用插件)
        + [vim-airline](#vim-airline)
        + [vim-deus](#vim-deus)
        + [vim-snazzy](#vim-snazzy)
        + [undotree](#undotree)
        + [goyo](#goyo)
        + [vim-startify](#vim-startify)
        + [gitsigns.nvim](#gitsignsnvim)
        + [rainbow](#rainbow)
        + [wildfire](#wildfire)
        + [treesitter](#treesitter)
        + [tagbar](#tagbar)
        + [markdown-preview](#markdown-preview)
        + [vim-table-mode](#vim-table-mode)
        + [vim-markdown-toc](#vim-markdown-toc)
        + [vim-markdown](#vim-markdown)
        + [fcitx.vim](#fcitxvim)
        + [coc.nvim](#cocnvim)

<!-- /TOC -->
## vim-plug

vim-plug 是一个 vim 插件自动管理的工具

首先需要[安装](https://github.com/junegunn/vim-plug) `vim-plug`



**插件安装**

将下面的结构写入 vim/nvim 的配置文件即可

指定插件保存在：`$HOME/.config/nvim/plugged`

```vim
call plug#begin('$HOME/.config/nvim/plugged')

call plug#end()
```

想要安装什么插件，只需要将其写入结构内即可

> 例如：安装插件 `vim-airline` 和 `vim-airline-themes`
>
> ```
> call plug#begin()
> 
> Plugin 'vim-airline/vim-airline'
> Plugin 'vim-airline/vim-airline-themes'
> 
> call plug#end()
> ```

保存退出，之后再重新进入 vim 配置文件并  `:PlugInstall` 便会自动安装结构中的插件







### 常用插件



#### vim-airline

> 下方 vim 的状态栏

```vim
Plug 'vim-airline/vim-airline'              " vim下方的状态栏
Plug 'vim-airline/vim-airline-themes'       " 包含了众多好看的vim-airline配色
```



安装完之后需要在 vim 配置文件中进行设置

```vim
let g:airline_theme='deus'                  " 指定airline配色
```



#### vim-deus

> vim 主题配色

```vim
Plug 'ajmwagar/vim-deus'					" 原作者
Plug 'theniceboy/nvim-deus'                 " CW大佬根据原作者的进行了修改
```

> 建议使用 CW 大佬的配色方案
>
> 原作者的缩进符号颜色太过亮眼
>
> CW 大佬的缩进符号颜色不是很亮眼



安装完之后需要在 vim 配置文件中进行设置

```vim
set background=dark                         " 设置为dark模式
colorscheme deus                            " 指定vim的配色方案
let g:deus_termcolors=256                   " dues主题的终端颜色为256色
```



#### vim-snazzy

> vim 主题配色

```vim
Plug 'connorholyday/vim-snazzy'
```



安装完之后需要在 vim 配置文件中进行设置

```vim
let g:SnazzyTransparent = 1						" 开启透明
colorscheme snazzy								" 指定vim配色方案
```

> 如果需要开启透明，必须放在 `let g:SnazzyTransparent = 1` 前面



#### undotree

> 以树形的结构显示出文件的修改历史，并且可以在这些历史版本中进行切换

```vim
Plug 'mbbill/undotree'
```

```vim
" 按L开启/关闭undotree
nnoremap L :UndotreeToggle<CR>
" 自动打开差异窗口
let g:undotree_DiffAutoOpen = 1
" 使得undotree窗口在打开后获得焦点
let g:undotree_SetFocusWhenToggle = 1
" 不使用简写来节省空间
let g:undotree_ShortIndicators = 1
" 采用第二中窗口布局
let g:undotree_WindowLayout = 2
" diff窗口高度
let g:undotree_DiffpanelHeight = 8
" undotree窗口宽度
let g:undotree_SplitWidth = 24
" 在undotree窗口中，自定义按键
" u:上
" e:下
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc
```



#### goyo

> 简洁视角

```vim
Plug 'junegunn/goyo.vim'
```

```vim
" 开启/关闭goyo
noremap <LEADER>gy :Goyo<CR>
" 指定显示宽度
let g:goyo_width = 95
" 指定显示高度
let g:goyo_height = 100
```



#### vim-startify

> 直接打开vim时，会根据最近打开文件的状况列出一个列表，可以选择编辑哪个文件

```vim
Plug 'mhinz/vim-startify'
```

安装即可直接实用，不需要什么配置，很多默认配置已经开启



#### gitsigns.nvim

> 将 git 集成到 nvim 中

```vim
Plug 'lewis6991/gitsigns.nvim'
```

> 在左侧栏根据 git 的文件状态显示不同的标志

```vim
lua <<EOF
require('gitsigns').setup({
	signs = {
    add          = { hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    change       = { hl = 'GitSignsChange', text = '░', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '▔', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '▒', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
  },
})
EOF
nnoremap H :Gitsigns preview_hunk_inline<CR>
nnoremap <LEADER>gr :Gitsigns reset_hunk<CR>
nnoremap <LEADER>gb :Gitsigns blame_line<CR>
nnoremap <LEADER>g- :Gitsigns prev_hunk<CR>
nnoremap <LEADER>g= :Gitsigns next_hunk<CR>
```





#### rainbow

> rainbow 提供了成对符号用颜色匹配的功能

```vim
Plug 'luochen1990/rainbow'
```

> 只需要激活即可使用

```vim
let g:rainbow_active = 1
```





#### wildfire

> 提供使用回车快速选择成对符号内字符的功能。嵌套使用函数时，将光标放到内部，多次按回车可以扩选括号匹配的内容

```vim
Plug 'gcmt/wildfire.vim'
```

```vim
map <c-b> <Plug>(wildfire-quick-select)
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "it"],
    \ "html,xml" : ["at", "it"],
\ }
```





#### treesitter

> 强化代码高亮

```vim
Plug 'nvim-treesitter/nvim-treesitter'
```

> 安装对应需要强化高亮的文件类型
>
> 并开启高亮
>
> 应用所有文件类型

```vim
lua <<EOF
require'nvim-treesitter.configs'.setup {
	-- one of "all", "language", or a list of languages
	ensure_installed = {"c", "cpp", "java", "python", "vim", "json", "lua"},
	highlight = {
		enable = true,              -- false will disable the whole extension
		disable = {},  -- list of language that will be disabled
	},
}
EOF
```

#### tagbar
> 在窗口右侧新开辟一个小窗口，用于浏览当前文件的标签并获得结构概览

> 不仅可以显示 Markdown 的大纲结构，还可以显示其他语言中的方法或类等

> 需要安装 `ctags`

```vim
preservim/tagbar
```
```vim
nmap tb :TagbarToggle<CR>
```




#### markdown-preview
> 在浏览器中预览 markdown 文档

```vim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
```

> 配置基本开箱即用，这里只更改了打开的浏览器为 chromium  
  以及更改了预览颜色为亮色

```vim
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_theme = 'light'
```

#### vim-table-mode
> markdown 更方便的插入表格

```vim
Plug 'dhruvasagar/vim-table-mode'
```
> 默认配置开箱即用，默认快捷键定义合理  
> 一些有用的默认快捷键：  
> * `<LEADER>tdd`：删除光标行  
> * `<LEADER>tdc`：删除光标列  
> * `<LEADER>tic`：添加一列  
> 
> 还有一些其他功能暂时不需要

```vim
noremap <LEADER>tm :TableModeToggle<CR>
let g:table_mode_cell_text_object_i_map = 'k<Bar>'
```


#### vim-markdown-toc
> 为 Markdown 文件生成 Table of Contents，目前支持 GFM 和 Redcarpet 两种链接风格  
> 更新已经存在的 Table of Contents  
> 保存文件时自动更新 Table of Contents

```vim
Plug 'mzlogin/vim-markdown-toc'
```
> `let g:vmt_cycle_list_item_markers = 1` : Table of Contents 项目前面的标记将根据级别循环使用 `*`、`-` 和 `+`

```vim
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
```

**生成 Table of Contents**  
1. `:GenToGFM`  
    * 生成 GFM 链接风格的 Table of Contents
2. `:GenTocRedcarpet`
    * 生成 Redcarpet 链接风格的 Table of Contents


**删除 Table of Contents**  
删除本插件生成的 Table of Contents `:RemoveToc`

---

#### vim-markdown
> 提供了Markdown的语法高亮，段落折叠，查看目录，段间跳转等功能

```vim
Plug 'preservim/vim-markdown'
```
> 安装完成之后就自动按照插件默认进行高亮了  
> 这里我只需要高亮就好




#### fcitx.vim

> 从插入模式返回普通模式时，输入法会切换到英文状态  
> 当再次进入插入模式时，会根据上次在插入模式中输入法的状态来切换

> 一般开箱即用

```vim
Plug 'lilydjwg/fcitx.vim'
```


#### coc.nvim
> 支持 LSP ，是 vim 的一个插件，但是 coc 本身也支持插件  
> 关于特定语言的增强功能，需要单独安装特定语言的 coc 插件  
> 还有很多非常好用的非 LSP 插件

```vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
```
> 关于安装 coc 插件，可以使用如下方式，每次进入 vim 时都会自动安装数组中没有安装的插件  

```vim
let g:coc_global_extensions = []
```
> 例如：
> ```vim
> let g:coc_global_extensions = [
>     \ 'coc-json',
>     \ 'coc-tsserver']  
> ```
> 就是安装了两个 coc 插件：coc-json、coc-tsserver  
