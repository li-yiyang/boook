% ----- header -----
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{boook}

% ----- load class -----
\LoadClass{book} % use book class for preset

% ----- requirements -----
\RequirePackage{
  kvoptions,     % Key value format for package options
  etoolbox,      % e-TeX tools for LaTeX
  geometry,      % Flexible and complete interface to document dimensions
  xcolor,        % Driver-independent color extensions for LaTeX and pdfLaTeX
  graphicx,      % Enhanced support for graphics
  hyperref,      % Extensive support for hypertext
  titlesec,      % Select alternative section titles
  titletoc,      % Alternative headings for toc/lof/lot
  fancyhdr,      % Extensive control of page headers and footers in LaTeX2ε
  minted,        % Highlighted source code for LATEX
  tabularx,      % Tabulars with adjustable-width columns
}

% ----- options -----
\SetupKeyvalOptions{                        % set up kvoptions
  family=BOOOK, prefix=BOOOK@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{BOOOK}{#1}} % quick binding

% language
\DeclareStringOption[mix]{lang}             % {default}{name}
\DeclareVoidOption{en}{\ekv{lang=en}}       % valid k-v pairs
\DeclareVoidOption{cn}{\ekv{lang=cn}}
\DeclareVoidOption{mix}{\ekv{lang=mix}}     % en keyword with chinese support

% color set
\DeclareStringOption[plain]{colorsets}
\DeclareVoidOption{plain}{\ekv{colorsets=plain}}

% geometry mode
\DeclareStringOption[default]{geomode}
\DeclareVoidOption{default}{\ekv{geomode=default}} % inner is greater for printting
\DeclareVoidOption{digital}{\ekv{geomode=digital}} % texts are centered digital useage

% minted code
\DeclareStringOption[none]{code} % none or minted
\DeclareVoidOption{minted}{\ekv{code=minted}}
\DeclareVoidOption{none}{\ekv{code=none}}

\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax


% ----- code -----
%% quick ifdefstringor code \ifdefstringor{varname}{{val1}{val2}}{true}{false}
%% from https://tex.stackexchange.com/questions/351063/ifdefstring-with-logical-operator-is-it-possible
\newcommand{\ifdefstringor}[2]{%
  \begingroup\edef\x{\endgroup
    \noexpand\ifboolexpr{
      test {\noexpand\ifdefstring{\noexpand#1}{\@firstoftwo#2}}
      or
      test {\noexpand\ifdefstring{\noexpand#1}{\@secondoftwo#2}}
    }%
  }\x
}

%% language
\ifdefstringor{\BOOOK@lang}{{cn}{mix}}{
  \RequirePackage[UTF8, scheme=plain]{ctex}
  \xeCJKsetup{AutoFakeBold=true}
}{\relax}

%% geometry
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           top   [headheight]
%    %%%%%%%%%%%%%%[headsep] %
%    % height:         %     %
%    %    textheight   %     %
%left%                 %right%
% (inner)              %  (outer)
%    %                 [marginsep]
%    %     width:      % [marginparwidth]
%    %       textwidth %     %  (margin note)
%    %%%%%%%%%%%%%[footskip] %
%         bottom  [footheight]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifdefstring{\BOOOK@geomode}{default}{
\geometry{ % default for printing
  paper=b6paper,
  inner=23mm,
  outer=11mm,
  top=15mm,
  bottom=10mm,
  headheight=8mm,
  headsep=5mm,
  footskip=7mm
}}{
\geometry{ % better for digital reading
  paper=b6paper,
  inner=17mm,
  outer=17mm,
  top=15mm,
  bottom=10mm,
  headheight=8mm,
  headsep=5mm,
  footskip=7mm
}
}

%% xcolor
%%% The basic colorsets form Emacs
%%%% use part of the color defined in my emacs
%%%% in emacs M-x list-colors-display
%%%% convert by ruby code:
%%%%
%%%% a = File.open("color.txt").each_line.map do |line|
%%%%   temp = line.strip.split(/\t+/)
%%%%   [
%%%%     temp.first,
%%%%     temp.last.split(/\s{2,}/).select {|a| !a.empty? }
%%%%   ].flatten
%%%% end
%%%% s = a.map do |item|
%%%%   "\\definecolor{#{item.first.gsub(" ", "")}}{RGB}" + \
%%%%   "{#{item.last[1..2].to_i(16)}," + \
%%%%   "#{item.last[3..4].to_i(16)}," + \
%%%%   "#{item.last[5..6].to_i(16)}}"
%%%% end.join("\n")
%%%% 
%%%% and with some small refining, it should be ok to use
\definecolor{black}{RGB}{0,0,0}
\definecolor{dimgray}{RGB}{105,105,105}
\definecolor{darkgray}{RGB}{169,169,169}
\definecolor{gray}{RGB}{190,190,190}
\definecolor{lightgray}{RGB}{211,211,211}
\definecolor{gainsboro}{RGB}{220,220,220}
\definecolor{whitesmoke}{RGB}{245,245,245}
\definecolor{white}{RGB}{255,255,255}
\definecolor{red}{RGB}{255,0,0}
\definecolor{orangered}{RGB}{255,69,0}
\definecolor{darkorange}{RGB}{255,140,0}
\definecolor{orange}{RGB}{255,165,0}
\definecolor{gold}{RGB}{255,215,0}
\definecolor{yellow}{RGB}{255,255,0}
\definecolor{chartreuse}{RGB}{127,255,0}
\definecolor{lawngreen}{RGB}{124,252,0}
\definecolor{green}{RGB}{0,255,0}
\definecolor{springgreen}{RGB}{0,255,127}
\definecolor{mediumspringgreen}{RGB}{0,250,154}
\definecolor{cyan}{RGB}{0,255,255}
\definecolor{deepskyblue}{RGB}{0,191,255}
\definecolor{blue}{RGB}{0,0,255}
\definecolor{mediumblue}{RGB}{0,0,205}
\definecolor{darkviolet}{RGB}{148,0,211}
\definecolor{darkmagenta}{RGB}{139,0,139}
\definecolor{magenta}{RGB}{255,0,255}
\definecolor{darkred}{RGB}{139,0,0}
\definecolor{brown}{RGB}{165,42,42}
\definecolor{firebrick}{RGB}{178,34,34}
\definecolor{indianred}{RGB}{205,92,92}
\definecolor{lightcoral}{RGB}{240,128,128}
\definecolor{salmon}{RGB}{250,128,114}
\definecolor{lightsalmon}{RGB}{255,160,122}
\definecolor{tomato}{RGB}{255,99,71}
\definecolor{coral}{RGB}{255,127,80}
\definecolor{darksalmon}{RGB}{233,150,122}
\definecolor{rosybrown}{RGB}{188,143,143}
\definecolor{sienna}{RGB}{160,82,45}
\definecolor{saddlebrown}{RGB}{139,69,19}
\definecolor{chocolate}{RGB}{210,105,30}
\definecolor{peru}{RGB}{205,133,63}
\definecolor{sandybrown}{RGB}{244,164,96}
\definecolor{burlywood}{RGB}{222,184,135}
\definecolor{tan}{RGB}{210,180,140}
\definecolor{navajowhite}{RGB}{255,222,173}
\definecolor{wheat}{RGB}{245,222,179}
\definecolor{darkgoldenrod}{RGB}{184,134,11}
\definecolor{goldenrod}{RGB}{218,165,32}
\definecolor{lightgoldenrod}{RGB}{238,221,130}
\definecolor{palegoldenrod}{RGB}{238,232,170}
\definecolor{cornsilk}{RGB}{255,248,220}
\definecolor{darkkhaki}{RGB}{189,183,107}
\definecolor{khaki}{RGB}{240,230,140}
\definecolor{lemonchiffon}{RGB}{255,250,205}
\definecolor{darkolivegreen}{RGB}{85,107,47}
\definecolor{olivedrab}{RGB}{107,142,35}
\definecolor{yellowgreen}{RGB}{154,205,50}
\definecolor{greenyellow}{RGB}{173,255,47}
\definecolor{lightgreen}{RGB}{144,238,144}
\definecolor{forestgreen}{RGB}{34,139,34}
\definecolor{darkgreen}{RGB}{0,100,0}
\definecolor{limegreen}{RGB}{50,205,50}
\definecolor{palegreen}{RGB}{152,251,152}
\definecolor{darkseagreen}{RGB}{143,188,143}
\definecolor{seagreen}{RGB}{46,139,87}
\definecolor{mediumseagreen}{RGB}{60,179,113}
\definecolor{lightseagreen}{RGB}{32,178,170}
\definecolor{mediumaquamarine}{RGB}{102,205,170}
\definecolor{aquamarine}{RGB}{127,255,212}
\definecolor{darkcyan}{RGB}{0,139,139}
\definecolor{darkturquoise}{RGB}{0,206,209}
\definecolor{mediumturquoise}{RGB}{72,209,204}
\definecolor{turquoise}{RGB}{64,224,208}
\definecolor{paleturquoise}{RGB}{175,238,238}
\definecolor{powderblue}{RGB}{176,224,230}
\definecolor{lightblue}{RGB}{173,216,230}
\definecolor{skyblue}{RGB}{135,206,235}
\definecolor{lightskyblue}{RGB}{135,206,250}
\definecolor{cadetblue}{RGB}{95,158,160}
\definecolor{steelblue}{RGB}{70,130,180}
\definecolor{darkslategray}{RGB}{47,79,79}
\definecolor{slategray}{RGB}{112,128,144}
\definecolor{lightslategray}{RGB}{119,136,153}
\definecolor{royalblue}{RGB}{65,105,225}
\definecolor{dodgerblue}{RGB}{30,144,255}
\definecolor{cornflowerblue}{RGB}{100,149,237}
\definecolor{lightsteelblue}{RGB}{176,196,222}
\definecolor{darkblue}{RGB}{0,0,139}
\definecolor{navy}{RGB}{0,0,128}
\definecolor{midnightblue}{RGB}{25,25,112}
\definecolor{darkslateblue}{RGB}{72,61,139}
\definecolor{slateblue}{RGB}{106,90,205}
\definecolor{mediumslateblue}{RGB}{123,104,238}
\definecolor{lightslateblue}{RGB}{132,112,255}
\definecolor{mediumpurple}{RGB}{147,112,219}
\definecolor{blueviolet}{RGB}{138,43,226}
\definecolor{purple}{RGB}{160,32,240}
\definecolor{darkorchid}{RGB}{153,50,204}
\definecolor{mediumorchid}{RGB}{186,85,211}
\definecolor{orchid}{RGB}{218,112,214}
\definecolor{thistle}{RGB}{216,191,216}
\definecolor{plum}{RGB}{221,160,221}
\definecolor{violet}{RGB}{238,130,238}
\definecolor{mediumvioletred}{RGB}{199,21,133}
\definecolor{violetred}{RGB}{208,32,144}
\definecolor{palevioletred}{RGB}{219,112,147}
\definecolor{maroon}{RGB}{176,48,96}
\definecolor{deeppink}{RGB}{255,20,147}
\definecolor{hotpink}{RGB}{255,105,180}
\definecolor{pink}{RGB}{255,192,203}
\definecolor{lightpink}{RGB}{255,182,193}
\definecolor{snow}{RGB}{255,250,250}
\definecolor{mistyrose}{RGB}{255,228,225}
\definecolor{seashell}{RGB}{255,245,238}
\definecolor{peachpuff}{RGB}{255,218,185}
\definecolor{linen}{RGB}{250,240,230}
\definecolor{antiquewhite}{RGB}{250,235,215}
\definecolor{bisque}{RGB}{255,228,196}
\definecolor{papayawhip}{RGB}{255,239,213}
\definecolor{moccasin}{RGB}{255,228,181}
\definecolor{blanchedalmond}{RGB}{255,235,205}
\definecolor{oldlace}{RGB}{253,245,230}
\definecolor{floralwhite}{RGB}{255,250,240}
\definecolor{beige}{RGB}{245,245,220}
\definecolor{lightyellow}{RGB}{255,255,224}
\definecolor{lightgoldenrodyellow}{RGB}{250,250,210}
\definecolor{ivory}{RGB}{255,255,240}
\definecolor{honeydew}{RGB}{240,255,240}
\definecolor{mintcream}{RGB}{245,255,250}
\definecolor{lightcyan}{RGB}{224,255,255}
\definecolor{azure}{RGB}{240,255,255}
\definecolor{aliceblue}{RGB}{240,248,255}
\definecolor{lavender}{RGB}{230,230,250}
\definecolor{ghostwhite}{RGB}{248,248,255}
\definecolor{lavenderblush}{RGB}{255,240,245}

%%% Assigning different color sets for boook
%%%% Note: About how to add a new set of color
%%%% I think I've provided enough options to
%%%% handle the color settings. All you need
%%%% to do is simply copy the plain color set
%%%% and replace its name and also the colorname.
%%%% if you use emacs, it is helpful if you
%%%% use M-x list-colors-display to see the color.
\ifdefstring{\BOOOK@colorsets}{plain}{
  % basic color
  \newcommand{\titlecolor}{black}
  \newcommand{\subtitlecolor}{dimgray}
  \newcommand{\titledashcolor}{lightgray}
  \newcommand{\authorcolor}{gray}
  \newcommand{\chaptercolor}{dimgray}
  \newcommand{\sectioncolor}{dimgray}
  \newcommand{\subsectioncolor}{darkgray}
  \newcommand{\subsubsectioncolor}{gray}
  \newcommand{\linksintoccolor}{black}
  \newcommand{\linkcolorofhyperref}{darkgray}
  \newcommand{\urlcolorofhyperref}{darkgray}
  \newcommand{\citecolorofhyperref}{darkgray}
  % some color you may not likely to change one by one
  \newcommand{\keywordbigcolor}{dimgray}
  \newcommand{\keywordsmallcolor}{black}
  \newcommand{\partnamecolor}{\keywordbigcolor}
  \newcommand{\contentsnamecolor}{\keywordbigcolor}
  \newcommand{\listtablenamecolor}{\keywordbigcolor}
  \newcommand{\listfigurenamecolor}{\keywordbigcolor}
  \newcommand{\chapternamecolor}{\keywordbigcolor}
  \newcommand{\appendixnamecolor}{\keywordbigcolor}
  \newcommand{\bibnamenamecolor}{\keywordbigcolor}
  \newcommand{\indexnamecolor}{\keywordbigcolor}
  \newcommand{\figurenamecolor}{\keywordsmallcolor}
  \newcommand{\tablenamecolor}{\keywordsmallcolor}
}

%% graphicx
% add default graphics path
\graphicspath{{./figure/}{./figures/}{./img/}{./image/}{./images/}{./graphic/}{./graphics/}{./pic/}{./picture/}{./pictures/}}

%% hyperref
%% belowing code mainly from ElgantBook
\hypersetup{
  breaklinks,
  unicode,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfkeywords={BOOOK},
  colorlinks,
  linkcolor=\linkcolorofhyperref,
  citecolor=\citecolorofhyperref,
  urlcolor=\urlcolorofhyperref,
  plainpages=false,
  pdfstartview=FitH,
  pdfborder={0 0 0},
  linktocpage
}

%% pagenumber, header
%% from https://mirror-hk.koddos.net/CTAN/macros/latex/contrib/fancyhdr/fancyhdr.pdf
\fancyhf{} % remove former style
\fancyhead{} % clear all header fields
\fancyfoot{} % clear all footer fields
\ifdefstring{\BOOOK@geomode}{digital}{
    \fancyfoot[C]{\thepage} % for digital geomode, center the page number
  }{ % default
    \fancyfoot[LE,RO]{\thepage} % for default geomode, even page left, odd page right
  }
\renewcommand{\headrulewidth}{0pt} % no rule
\renewcommand{\footrulewidth}{0pt}

% ----- newcommands and renewcommands -----
%% commands for the particular label name specific
%% to different languages
%%% globally
\renewcommand{\partname}{\color{\partnamecolor}}
\renewcommand{\thepart}{Part \Roman{part}}

%%% chinese
\ifdefstring{\BOOOK@lang}{cn}{
  \renewcommand{\contentsname}{目录}
  \renewcommand{\listtablename}{表格目录}
  \renewcommand{\listfigurename}{插图目录}
  \renewcommand{\thepart}{第\zhnumber{\arabic{part}}部分}
  \renewcommand{\figurename}{图}
  \renewcommand{\tablename}{表}
  \renewcommand{\bibname}{参考文献}
  \renewcommand{\appendixname}{附录}
  \renewcommand{\indexname}{索引}
  \renewcommand{\chaptername}{章}
}{\relax}

%% commands that procedure arguments
\global\let\@title\@empty
\global\let\@author\@empty
\global\let\@date\@empty
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\logo}[1]{\gdef\@logo{#1}}
\newcommand{\cover}[1]{\gdef\@cover{#1}}

%% commands that used in document
\renewcommand*{\maketitle}{%
\begin{titlepage} % specify the title page
  \newgeometry{margin=0in}
  \pagenumbering{Alph} % not counting title page into normal page
  \hypersetup{pageanchor=false}
  \parindent=0pt % no paragraph indent
  \ifcsname @cover\endcsname % set cover image
    \includegraphics[ % the best of the image size should be 1476*1870 300dpi
      width=\linewidth,
      height=0.9\textheight,
      % keepaspectratio % force resize the image for better alignment
    ]{\@cover} 
  \else % if user not provide cover image, will try using default cover image
    \ClassWarning{boook}{No Cover Image provided, Trying on default cover.png}
    \includegraphics[
      width=\linewidth,
      height=0.9\textheight,
      % keepaspectratio
    ]{cover.png}
  \fi
  % below is the main title part
  \vfill
  \hspace{5mm}
  \begin{minipage}[c]{0.65\linewidth} % title subtitle author
    \begin{huge}\color{\titlecolor}\bfseries{\ifcsname @title\endcsname \@title\else Title \fi}\end{huge}
    \vfill
    \hspace{2mm} \color{\subtitlecolor}\ifcsname @subtitle\endcsname \color{dimgray}\bfseries{\@subtitle} \fi
    \hspace{0.5mm}\color{\titledashcolor}\bfseries{|} 
    \begin{small}\color{\authorcolor}\@author\end{small}
  \end{minipage}
  \hspace{7mm}
  \begin{minipage}[c]{0.2\textwidth} % logo page
    \vfill
    \ifcsname @logo\endcsname
      \includegraphics[
      width=\linewidth,
      height=0.1\textheight,
      keepaspectratio
      ]{\@logo} 
    \else
      \ClassWarning{boook}{No Cover Image provided, Trying on default logo.png}
      \includegraphics[
      width=\linewidth,
      height=0.2\textheight,
      keepaspectratio
      ]{logo.png}
    \fi
    \vfill
  \end{minipage}
  \vfill
  \vfill
\end{titlepage}
\restoregeometry
\thispagestyle{empty}
\pagenumbering{arabic}
}

%% table of contents
\renewcommand{\tableofcontents}{%
  \hypersetup{linktoc=all, linkcolor=\linksintoccolor}
  \chapter*{\color{\contentsnamecolor}%
      \contentsname\@mkboth{%
      \MakeUppercase\contentsname}{%
      \MakeUppercase\contentsname}
  }%
  \@starttoc{toc}
  \hypersetup{linkcolor=skyblue}
}
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
  \pagenumbering{roman}
  \oldtableofcontents
  \pagenumbering{arabic}
  \setcounter{page}{0}
}

%% chapter style
%% frome https://tex.stackexchange.com/questions/94729/how-to-customize-chapter-heading-style
%%
%% <chapter label>
%% [before]
%% [after]<main part>
%%
\titleformat{\chapter}% command
[display]% shape
{\normalsize\color{\chaptercolor}}% format of the main part
{\normalsize\color{\chapternamecolor}% color
  \large\bfseries\chaptertitlename% titlename
  \hspace{0.5em}% space
  \huge\bfseries\thechapter}% chapter label
{1pt}% before
{\bfseries\huge}% after

% the following is editted from titlesec document
%% from http://tug.ctan.org/tex-archive/macros/latex/contrib/titlesec/titlesec.pdf
\titleformat{\section}%
{\normalfont\Large\bfseries\color{\sectioncolor}}%
{\thesection}{1em}{}

\titleformat{\subsection}%
{\normalfont\large\bfseries\color{\subsectioncolor}}%
{\thesubsection}{1em}{}

\titleformat{\subsubsection}%
{\normalfont\normalsize\bfseries\color{\subsubsectioncolor}}%
{\thesubsubsection}{1em}{}

\titleformat{\paragraph}[runin]%
{\normalfont\normalsize\bfseries\color{black}}%
{\theparagraph}{1em}{}

\titleformat{\subparagraph}[runin]%
{\normalfont\normalsize\bfseries\color{black}}%
{\thesubparagraph}{1em}{}

\titlespacing*{\chapter}{0pt}{50pt}{40pt}
\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\paragraph}{0pt}{3.25ex plus 1ex minus .2ex}{1em}
\titlespacing*{\subparagraph}{\parindent}{3.25ex plus 1ex minus .2ex}{1em}

% ----- other commands and enviroments -----
%% insert image
\newcommand{\image}[2][]{
\begin{figure}[!htbp]
  \centering
  \includegraphics[
    width=0.618\textwidth,
    height=0.147\textheight,
    keepaspectratio
  ]{#2}
  % test var if empty
  %% from https://tex.stackexchange.com/questions/53068/how-to-check-if-a-macro-value-is-empty-or-will-not-create-text-with-plain-tex-co
  \def\temp{#1}\ifx\temp\empty
  \else
    \caption{#1}
  \fi
\end{figure}
}

%% minted: insert code
%% from https://tex.stackexchange.com/questions/42393/new-environment-with-minted
\ifdefstring{\BOOOK@code}{minted}{
\newenvironment{code}[1]
 {\VerbatimEnvironment % use this to avoid other formatts distrubting
  \begin{minted}[tabsize=2,breaklines]{#1}}
 {\end{minted}}
}{\relax}
