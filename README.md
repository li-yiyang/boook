# boook
A very simple LaTeX template class for learning. 

## How to use
> Note: If you are really new in LaTeX,
> please check the `example.pdf` in this project.  
> 如果你对 LaTeX 一无所知, 那么可以参考项目里面的
> `example.pdf` 来学习一下. 

### Old Method - (Stable, But Hard)
If you just need to use it as a normal class 
(for which I think is foolish, because 
now [2022/10/28 ver.book], any other package 
could be better than this one. ), I suggest
you just simply download (or clone) the project
write your own `.tex` file with `\documentclass{boook}`
included, and simply compile the document.

如果你只是想要想普通的 LaTeX 类一样用的话, 
(尽管现在 [2022/10/28 ver.book] 不建议使用),
你可以直接下载这个仓库, 然后在自己的 `.tex`
文件头包含 `\documentclass{boook}` 命令, 
然后编译文档. 

A simple example `.tex` I used to debug the
`.cls` file is named `example.tex` in the project,
you could try this out if you'd like. 
However, now [2022/10/28] you have to provide 
a cover image for titlepage, before I finally
make a good one. 

如果你愿意的话, 可以试试 `example.tex` 文件来试试. 
这个是我用来 debug 用的文件. 不过在我确定一个好的封面图片前,
你可能需要自己提供一个封面图片就是了. 

### New Method - (A Little Unstable)
If you're using Ruby with 3.1+ version, 
install gems with command: 
`gem install colorize fiber_scheduler`. 
And run `rake one <your-tex-file>`, that's all. 
(if you would not encounter compile errors. )

如果你使用 Ruby 3.1+ 版本的话 (用了 fiber_scheduler gem), 
使用 `gem install colorize fiber_scheduler`. 
然后运行 `rake one <你的-tex-文件名>`, 
就是这样. 

## About the boook
Boook would be a very simple LaTeX template class for
learning to write a `.cls` file. It is now still
under development [2022/10/28] and later at some time,
I will publish a blog for tutorial. 

Boook 的定位是一个用于学习如何编写 `.cls` 文件的简单的
LaTeX 模版. 目前正在编写的过程中 [2022/10/28]. 
~~并且再过一段时间, 我将会写一个相应的教程. ~~

(**[2022/11/03] Update | 更新**: 
[Blog (chinese)](https://li-yiyang.github.io/misc/make-my-latex-class/) is done. 
[博客](https://li-yiyang.github.io/misc/make-my-latex-class/)写好了. )

It is inspired by the 
[ElgantBook](https://github.com/ElegantLaTeX/ElegantBook),
and most of the code is learnt on it. But the boook is
different from Elgantbook. 

尽管这个项目是在 
[ElgantBook](https://github.com/ElegantLaTeX/ElegantBook)
的启发下开始的, 并且很多的代码都是从其代码中学来的. 
但是 boook 和它还是有很多的区别的. 

And for the version management, inspired by TeX version
management, I would call the initial version as **book**,
for it was just simply `\LoadClass{book}` for the built-in
class. And the next versions should be **boook**, 
**booook** and so on. Since I think I would not spent
much time on it, the number `o` should not be messy
in the possible future :p

因为受到 TeX 的启发, 我选择用 **book** 来标识最初的版本, 
(毕竟它就只是一个调用内置 book 样式的一个简单命令:
`\LoadClass{book}` ), 而之后的版本将会使用 **boook**,
**booook** 这样的形式来标识. 
又因为我可能不会在这个项目上花很多时间,
所以版本里面的 `o` 的数量应该不会特别多 :p

### Simple Log
* **[2022/11/03] Update | 更新**:   
  Almost done, though I can't tell it version boook. 
  Issues are still in the template. Future works:  
  基本完成了, 但是仍然不敢叫 `boook` 版本.
  还有很多的缺陷. 之后需要做的: 
  * More color sets | 增加更多颜色配色
  * Better caption effect | 修改添加图表的 `caption` 的显示效果
  * Better Automation | 更好的自动化 Rakefile
  * Others | 其他一些目前还没想到的东西
* **[2022/11/05] Update | 更新**:  
  Rewrite the `example.tex` to a basic LaTeX tutorial.  
  将 `example.tex` 重新写成了一个简单的 LaTeX 教程. 
