\NeedsTeXFormat{LaTeX2e}

% Author: Shimpei Matsumoto
% Update: 2016/01/24
% Version: 3.00

%=======================================
% オプションのフラグの定義と初期化
%=======================================

\newif\if@Shoroku
\@Shorokufalse

\newif\if@Shinchoku
\@Shinchokufalse

\newif\if@Chukan
\@Chukanfalse

\DeclareOption{shoroku}{
\@Shorokutrue
}

\DeclareOption{shinchoku}{
\@Shinchokutrue
}

\DeclareOption{chukan}{
\@Chukantrue
}

\ProcessOptions\relax

%=======================================
% パッケージ類の読み込み
%=======================================

\LoadClass[a4j,8pt]{jarticle}
\usepackage[top=23truemm,bottom=15truemm,left=20truemm,right=20truemm]{geometry}

\usepackage{fancybox}
\usepackage{graphicx,color}
\usepackage{fancyhdr}
\usepackage{setspace} % setspaceパッケージのインクルード
\usepackage{amsmath}%数式用に追加
%\usepackage{here}
\usepackage{graphicx}
\usepackage{latexsym}
\usepackage[varg]{txfonts}
\usepackage{array}%追加

%================================================
%  ページ寸法の指定
%  現在はgeometryパッケージの利用のためほぼ利用していない
%================================================

%\renewcommand{\headrulewidth}{0pt}

%\addtolength{\topmargin}{-20mm}
%\addtolength{\headsep}{20mm}

%\headheight=\z@
%\marginparwidth\z@
%\marginparsep\z@
%\hoffset\z@
%\voffset\z@

%\oddsidemargin=\z@
%\advance\oddsidemargin by -1in
%\advance\oddsidemargin by 22.5mm
%\evensidemargin\oddsidemargin
\textwidth=\paperwidth
% ヘッダの開始位置を定義
\advance\textwidth by -40mm
 
%\footskip=15mm
%\headsep=11mm
%\topmargin=-2mm
%\headheight=40mm

%\footskip=7mm
%ヘッダの位置
\headsep=5mm
%\topmargin=0mm
%\headheight=7mm

%参考
%http://cns-guide.sfc.keio.ac.jp/2001/11/5/1.html

%\advance\topmargin by -1in
%\textheight=\paperheight
%\advance\textheight by -34mm

%=======================================
% キャプションを作成するコマンドを再定義
%=======================================

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \iftdir\sbox\@tempboxa{#1\hskip1zw#2}%
    \else\sbox\@tempboxa{#1 #2}%
  \fi
  \ifdim \wd\@tempboxa >\hsize
    \iftdir #1\hskip1zw#2\relax\par
      \else #1 #2\relax\par\fi
  \else
    \global \@minipagefalse
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip%
}

%=====================================
% タイトルの内容を保持する変数の初期化
%=====================================

\def\@title{ }
\def\@papertype{ }
\def\@author{ }
\def\@snumber{ }
\def\@keywords{ }
\long\def\@abstract{ }
\def\@date{ }
\def\maketitle{}


%=======================================
% タイトルの内容を設定するコマンドの定義
%=======================================

\def\title#1{\def\@title{#1}}
\def\papertype#1{\def\@papertype{#1}}
\def\author#1{\def\@author{#1}}
\def\snumber#1{\def\@snumber{#1}}
\def\advisor#1{\def\@advisor{#1}}
\def\keywords#1{\def\@keywords{#1}}
\def\date#1{\def\@date{#1}}
\long\def\abstract#1{\long\def\@abstract{#1}}

%=================================
% デフォルトで概要を設定
%=================================

\def\@maketitle{
  \begin{center}
    \vspace*{0pt}
    {\LARGE \textbf \@title \par}
    \vspace{4mm}
    %{\scalebox{1.06}{\LARGE\textbf\@title}}\\[12pt]
    {\large \@snumber~~~\@author~~~指導教員~~\@advisor }\\
    {\large 広島工業大学　情報学部　知的情報システム学科}    \vspace{0mm}
    \dimen@=\textwidth
    \advance\dimen@ 0zh
    \hspace{0zh}
  \end{center}
  \vspace{1zh}
}

%===============================
% 抄録が指定されたのときの処理
% これは現在使われていない
%===============================

\if@Shoroku
  \headheight=0mm
  \advance\textheight by 12mm

  \def\@maketitle{
    \begin{center}
      \vspace*{20pt}
      {\scalebox{1.06}{\LARGE\bf\@title} }\\[12pt]     
      {\large \@snumber~~~\@author}\\[10pt]
      {\large \@date}\\[7pt]
      {\it Key Words:} \@keywords
    \end{center}
   \vspace{1.0zh}
  }

  \newcommand{\sectionsize}{\@setfontsize\sectionsize\@xiipt{17}}
  \newcommand{\subsectionsize}{\@setfontsize\subsectionsize\@xipt{17}}

  \renewcommand{\section}{\@startsection{section}{1}{\z@}%
     {1.5\Cvs \@plus.5\Cvs \@minus.2\Cvs}%
     {.5\Cvs \@plus.3\Cvs}%
     {\reset@font\sectionsize\bfseries}}
  \renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
     {1.5\Cvs \@plus.5\Cvs \@minus.2\Cvs}%
     {.5\Cvs \@plus.3\Cvs}%
     {\reset@font\subsectionsize\bfseries}}
\fi

%===============================
% 進捗が指定されたのときの処理
%===============================

\if@Shinchoku
  \def\@maketitle{
    \begin{center}
        \vspace*{0pt}
        {\LARGE\textbf\@title }\\[12pt]
        {\large \@snumber~~~\@author}\\[5pt]
        {\large \@date}
    \end{center}
    \vspace{1.zh}
  }
\def\papertype#1{\def\@papertype{#1 進捗報告会}}
\fi

%===============================
% 中間発表が指定されたのときの処理
%===============================

\if@Chukan
\def\papertype#1{\def\@papertype{#1 中間発表}}
\fi

%===============================
% その他の設定
%===============================

\columnsep=6mm
\def\maketitle{\@maketitle}
\pagestyle{fancy}

\def\headrulewidth{2pt}
\def\headrulewidth{2pt}

%\rhead{\bf \small \@title（\@author）}
\rhead{}
\chead{\textbf\@papertype}
\lhead{}
\cfoot{\thepage}

\addtolength{\footskip}{30mm}

%===============================
% 文字数，行数の指定
% ref: http://d.hatena.ne.jp/Rion778/20091002/1254482262
%===============================

\makeatletter
\def\mojiparline#1{
    \newcounter{mpl}
    \setcounter{mpl}{#1}
    \@tempdima=\linewidth
    \advance\@tempdima by-\value{mpl}zw
    \addtocounter{mpl}{-1}
    \divide\@tempdima by \value{mpl}
    \advance\kanjiskip by\@tempdima
    \advance\parindent by\@tempdima
}
\makeatother
\def\linesparpage#1{
    \baselineskip=\textheight
    \divide\baselineskip by #1
}


% 一行あたり文字数の指定
\mojiparline{45}
% 1ページあたり行数の指定
\linesparpage{52}

%===============================
% 行間せまめitemize
%===============================

\newenvironment{ul}{%
 \vspace{-2mm}%
 \begin{itemize}%
 \setlength{\parskip}{0pt}   % 段落間の高さ
 \setlength{\itemsep}{0pt}   % 項目間の高さ
}%
{%
 \end{itemize}%
 \vspace{-2mm}%
}

\newenvironment{ull}{%
 \vspace{-2mm}%
 \begin{enumerate}%
 \setlength{\parskip}{0pt}   % 段落間の高さ
 \setlength{\itemsep}{0pt}   % 項目間の高さ
}%
{%
 \end{enumerate}%
 \vspace{-2mm}%
}

%===============================
% 箇条書きのカスタマイズ
% http://denki.nara-edu.ac.jp/~yabu/soft/tex/tex.html
%===============================


\makeatletter
\renewenvironment{itemize}%  
{%
   \begin{list}{$\bullet$\ \ }% 見出し記号／直後の空白を調節
   {%
      \setlength{\itemindent}{0pt}
      \setlength{\leftmargin}{1zw}%  左のインデント
      \setlength{\rightmargin}{0zw}% 右のインデント
      \setlength{\labelsep}{0zw}%    黒丸と説明文の間
      \setlength{\labelwidth}{3zw}%  ラベルの幅
      \setlength{\itemsep}{0em}%     項目ごとの改行幅
      \setlength{\parsep}{0em}%      段落での改行幅
      \setlength{\listparindent}{0zw}% 段落での一字下り
   }
}{%
   \end{list}%
}
\newcounter{enum}
\renewenvironment{enumerate}{%
   \begin{list}%
   {%
      \arabic{enum}.\ \,%  見出し記号／直後の空白を調節
   }%
   {%
      \usecounter{enum}
      \setlength{\itemindent}{0zw}%  ここは 0 に固定
      \setlength{\leftmargin}{3zw}%  左のインデント
      \setlength{\rightmargin}{0zw}% 右のインデント
      \setlength{\labelsep}{0zw}%    黒丸と説明文の間
      \setlength{\labelwidth}{3zw}%  ラベルの幅
      \setlength{\itemsep}{0em}%     項目ごとの改行幅
      \setlength{\parsep}{0em}%      段落での改行幅
      \setlength{\listparindent}{0zw}% 段落での一字下り
   }
}{%
   \end{list}%
}
\makeatother

%===============================
% セクション前後の余白を変更
% ref: http://www.damp.tottori-u.ac.jp/~ooshida/tex/
%===============================

%http://senta.s112.xrea.com/senta/Tips/000/51/
%\def\section{\@startsection {section}{1}{\z@}{ 1zw} {0.5zw}{\Large\bf}}

\makeatletter  % --- 「おまじないモード」に入る
\renewcommand{\section}{%
   \@startsection{section}{1}{\z@}%
   {0.7\Cvs \@plus.0\Cdp \@minus.2\Cdp}%  上の空き
   {0.3\Cvs \@plus.1\Cdp \@minus.3\Cdp}%  下の空き
   {\reset@font\large\bfseries}}%         字の大きさ
\makeatother   % --- 「おまじないモード」から抜ける
\makeatletter
\renewcommand{\subsection}{
   \@startsection{subsection}{1}{\z@}
   {0.5\Cvs \@plus.0\Cdp \@minus.2\Cdp}
   {0.3\Cvs \@plus.1\Cdp \@minus.3\Cdp}
   {\reset@font\large\bfseries}}
\makeatother
\makeatletter
\renewcommand{\subsubsection}{
   \@startsection{subsubsection}{1}{\z@}
   {0.5\Cvs \@plus.0\Cdp \@minus.2\Cdp}
   {0.3\Cvs \@plus.1\Cdp \@minus.3\Cdp}
   {\reset@font\bfseries}}
\makeatother

%===============================
% 図表のキャプション設定
% ref: http://oku.edu.mie-u.ac.jp/~okumura/texfaq/qa/46026.html
%===============================

\def\figurename{図}
\renewcommand{\tablename}{表}

\makeatletter
\long\def\@makecaption#1#2{%
  \setlength\abovecaptionskip{0\p@}
  \setlength\belowcaptionskip{0\p@}
  \small%% add this line
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1 #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\makeatother

%===============================
% 参考文献の行間隔の指定
% ref: http://oku.edu.mie-u.ac.jp/~okumura/texfaq/qa/47869.html
%===============================

\makeatletter
\renewenvironment{thebibliography}[1]
{\section*{\refname\@mkboth{\refname}{\refname}}%
\footnotesize
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep
	 \setlength\itemsep{0zh}%←ここの数値を調整
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy
   \clubpenalty4000
   \@clubpenalty\clubpenalty
   \widowpenalty4000%
   \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}
\def\JTeX{\leavevmode\lower .5ex\hbox{J}\kern-.17em\TeX}
\def\JLaTeX{\leavevmode\lower.5ex\hbox{J}\kern-.17em\LaTeX}
\makeatother