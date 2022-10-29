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
  graphicx,      % Enhanced support for graphics
  hyperref,      % Extensive support for hypertext
}

% ----- options -----
\SetupKeyvalOptions{                        % set up kvoptions
  family=BOOOK, prefix=BOOOK@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{BOOOK}{#1}} % quick binding

\DeclareStringOption[en]{lang}              % {default}{name}
\DeclareVoidOption{en}{\ekv{lang=en}}       % valid k-v pairs
\DeclareVoidOption{cn}{\ekv{lang=cn}}

\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax


% ----- code -----
%% language
\ifdefstring{\BOOOK@lang}{cn}{
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
\geometry{
  paper=b6paper,
  inner=25mm,
  outer=15mm,
  top=15mm,
  bottom=10mm,
  headheight=8mm,
  headsep=5mm,
  footskip=7mm
}

\renewcommand*{\maketitle}{ %
\begin{titlepage}
  \newgeometry{margin=0in}
  \parindent=0pt
  \includegraphics[width=\linewidth]{cover.png}
  
  \begin{huge}
	\@title
  \end{huge}
\end{titlepage}
}