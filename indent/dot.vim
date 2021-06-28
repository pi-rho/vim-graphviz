" Vim indent file
" Language:   Graphviz
" Maintainer: pi-rho <pi-rho@tyr.cx>
" Heavily Derived From: css.vim from Nikolai Weibull <now@bitwi.se>

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetGraphvizIndent()
setlocal indentkeys=0{,0},!^F,o,O
setlocal nosmartindent

let b:undo_indent = "setl smartindent< indentkeys< indentexpr<"

if exists("*GetGraphvizIndent")
  finish
endif
let s:keepcpo = &cpo
set cpo&vim

function s:prevnonblanknoncomment(lnum)
  let lnum = a:lnum
  while lnum > 1
    let lnum = prevnonblank(lnum)
    let line = getline(lnum)
    if line =~ '\*/'
      while lnum > 1 && line !~ '/[*/]'
        let lnum -= 1
      endwhile
      if line =~ '^\s*/[*/]'
        let lnum -= 1
      else
        break
      endif
    else
      break
    endif
  endwhile
  return lnum
endfunction

function s:count_braces(lnum, count_open)
  let n_open = 0
  let n_close = 0
  let line = getline(a:lnum)
  let pattern = '[{}]'
  let i = match(line, pattern)
  while i != -1
    if synIDattr(synID(a:lnum, i + 1, 0), 'name') !~ 'dotComment'
      if line[i] == '{'
        let n_open += 1
      elseif line[i] == '}'
        if n_open > 0
          let n_open -= 1
        else
          let n_close += 1
        endif
      endif
    endif
    let i = match(line, pattern, i + 1)
  endwhile
  return a:count_open ? n_open : n_close
endfunction

function GetGraphvizIndent()
  let line = getline(v:lnum)
  if line =~ '^\s*\*'
    return cindent(v:lnum)
  endif

  let pnum = s:prevnonblanknoncomment(v:lnum - 1)
  if pnum == 0
    return 0
  endif

  return indent(pnum) + s:count_braces(pnum, 1) * shiftwidth()
        \ - s:count_braces(v:lnum, 0) * shiftwidth()
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo
