"call vundle#begin()
"Plugin 'Valloric/YouCompleteMe’
"call vundle#end()
set nocompatible                 "去掉有关vi一致性模式，避免以前版本的bug和局限    

set nu!                                    "显示行号

set guifont=Luxi/Mono/9   " 设置字体，字体名称和字号

filetype on                              "检测文件的类型     

set history=1000                  "记录历史的行数

set background=dark          "背景使用黑色

syntax on                                "语法高亮度显示

set autoindent                       "vim使用自动对齐，也就是把当前行的对齐格式应用到下一行(自动缩进）

set cindent                             "（cindent是特别针对 C语言语法自动缩进）

set smartindent                    "依据上面的对齐格式，智能的选择对齐方式，对于类似C语言编写上有用   

set tabstop=4                        "设置tab键为4个空格，

set shiftwidth =4                   "设置当行之间交错时使用4个空格     

set ai!                                      " 设置自动缩进 

set showmatch                     "设置匹配模式，类似当输入一个左括号时会匹配相应的右括号      

set guioptions-=T                 "去除vim的GUI版本中得toolbar   

set vb t_vb=                            "当vim进行编辑时，如果命令错误，会发出警报，该设置去掉警报       

set ruler                                  "在编辑过程中，在右下角显示光标位置的状态行     

set paste									"原文本格式粘贴

"set mouse=a									"开启鼠标模式

set nohls                                "默认情况下，寻找匹配是高亮度显示，该设置关闭高亮显示     

set incsearch                        "在程序中查询一单词，自动匹配单词的位置；如查询desk单词，当输到/d时，会自动找到第一个d开头的单词，当输入到/de时，会自动找到第一个以ds开头的单词，以此类推，进行查找；当找到要匹配的单词时，别忘记回车 

set backspace=2           " 设置退格键可用
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.cc,*.[ch],*.hpp,*.sh,*.rb,*.java,*.py,*.php exec ":call SetTitle()"

""定义函数SetTitle，自动插入文件头
func SetTitle()
    "文件作者
    let file_author="jiangchuanhui Shanghai,Inc."
    "邮箱
    let mail="772762268@qq.com"

    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#!/usr/bin/env bash")
        call append(line("."),   "########################################################################")
        call append(line(".")+1, "#    File Name: ".expand("%"))
        call append(line(".")+2, "# ")
        call append(line(".")+3, "#       Author: ".file_author)
        call append(line(".")+4, "#         Mail: ".mail)
        call append(line(".")+5, "# Created Time: ".strftime("%c"))
        call append(line(".")+6, "#  Description: ...")
        call append(line(".")+7, "# ")
        call append(line(".")+8, "########################################################################")
        call append(line(".")+9, "set -u")
        call append(line(".")+10, "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# -*- coding=utf-8 -*-")
        call append(line(".")+1, "########################################################################")
        call append(line(".")+2, "#    File Name: ".expand("%"))
        call append(line(".")+3, "# ")
        call append(line(".")+4, "#       Author: ".file_author)
        call append(line(".")+5, "#         Mail: ".mail)
        call append(line(".")+6, "# Created Time: ".strftime("%c"))
        call append(line(".")+7, "#  Description: ...")
        call append(line(".")+8, "#                ")
        call append(line(".")+9, "########################################################################")
        call append(line(".")+10, "")
        call append(line(".")+11, "")
        call append(line(".")+12, "if __name__ == '__main__':")
        call append(line(".")+13, "\tpass")
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
    elseif &filetype == 'cpp'
    elseif &filetype == 'c'
    elseif &filetype == 'php'
        call setline(1, "<?php")
        call append(line("."), "/*")
        call append(line(".")+1, " * ".expand("%"))
        call append(line(".")+2, " * ")
        call append(line(".")+3, " * ...")
        call append(line(".")+4, " * @author ".file_author)
        call append(line(".")+5, " * @mail ".mail)
        call append(line(".")+6, " * @create ".strftime("%c"))
        call append(line(".")+7, " * ")
        call append(line(".")+8, "*/")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), " * File Name: ".expand("%"))
        call append(line(".")+1, " * ")
        call append(line(".")+2, " *       Author: ".file_author)
        call append(line(".")+3, " *         Mail: ".mail)
        call append(line(".")+4, " * Created Time: ".strftime("%c"))
        call append(line(".")+5, " *  Description: ...")
        call append(line(".")+6, " * ")
        call append(line(".")+7, " ************************************************************************")
        call append(line(".")+8, "*/")
        call append(line(".")+9, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+10, "#include<iostream>")
        call append(line(".")+11, "using namespace std;")
        call append(line(".")+12, "")
    elseif expand("%:e") == 'cc'
        call append(line(".")+10, "#include<iostream>")
        call append(line(".")+11, "using namespace std;")
        call append(line(".")+12, "")
    endif
    if &filetype == 'c'
        call append(line(".")+10, "#include<stdio.h>")
        call append(line(".")+11, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+10, "#ifndef __".toupper(expand("%:r"))."__H")
        call append(line(".")+11, "#define __".toupper(expand("%:r"))."__H")
        call append(line(".")+12, "#endif")
    elseif expand("%:e") == 'hpp'
        call append(line(".")+10, "#ifndef __".toupper(expand("%:r"))."__H")
        call append(line(".")+11, "#define __".toupper(expand("%:r"))."__H")
        call append(line(".")+12, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+10,"public class ".expand("%:r"))
        call append(line(".")+11,"")
    endif
    if &filetype == 'php'
        call append(line(".")+9,"")
        call append(line(".")+10,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal g

