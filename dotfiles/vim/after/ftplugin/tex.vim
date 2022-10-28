setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

setlocal textwidth=79

setlocal spell spelllang=en_us

iabbrev <buffer> eqn@ \begin{equation*}<CR>\end{equation*}<++><Esc>kA
iabbrev <buffer> eqa@ \begin{eqnarray*}<CR>\end{eqnarray*}<++><Esc>kA
iabbrev <buffer> sec@ \section*{}<CR><CR><++><Esc>2k$i
iabbrev <buffer> ssec@ \subsection*{}<CR><CR><++><Esc>2k$i
iabbrev <buffer> sssec@ \subsubsection*{}<CR><CR><++><Esc>2k$i
iabbrev <buffer> tab@ \begin{center}<CR>\begin{tabular}{\|c\|c\|c\|}<CR>\hline<CR>\\\hline<CR>\end{tabular}<CR>\end{center}<CR><CR><++><Esc>4kI
iabbrev <buffer> cases@ \begin{cases}<CR>\end{cases}<++><Esc>kA
iabbrev <buffer> matrixb@ \begin{bmatrix}<CR>\end{bmatrix}<++><Esc>kA
iabbrev <buffer> number@ \begin{itemize}<CR>\item<CR>\end{itemize}<++><Esc>kA
