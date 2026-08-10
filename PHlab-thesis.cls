\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PHlab-thesis}[2021/09/08 v1.0 NCKU Masters/PhD Thesis]

% oneside is necessary to avoid flipping
\LoadClass[12pt,a4paper,openany,oneside]{book}

\RequirePackage{etoolbox}

\RequirePackage{PHlab-fonts-config}%  Our setup for CJK and fonts.

\RequirePackage{array}
\RequirePackage{amsmath}
% \RequirePackage{amssymb}
\RequirePackage{unicode-math}

\RequirePackage{booktabs}%  For \{top|mid|bottom}rule
\RequirePackage{fancyhdr}
\RequirePackage{tabularx}%  Sometimes more convenient than \tabular or \tabular*

\RequirePackage{geometry}
\RequirePackage{type1cm}
% Margins of inside pages. See https://www.cc.ncku.edu.tw/rule/content.php?sn=684
\geometry{verbose,a4paper,tmargin=2.3cm,bmargin=3.5cm,lmargin=3cm,rmargin=2.5cm}

\RequirePackage{setspace}
\onehalfspace%  設行距為1.5倍

\hyphenpenalty=1024

\RequirePackage[bottom]{footmisc}

\RequirePackage[intoc]{nomencl}
\makenomenclature

\RequirePackage{indentfirst} % Indent first paragraph after section header
\RequirePackage[normalem]{ulem} % For strikethrough
\RequirePackage{pdfpages} % For certificate

% Some shits you might need ;)
\RequirePackage{multirow}
\RequirePackage{xcolor}
\RequirePackage{subcaption}

\DeclareOption{PhD}{\newcommand*\PhD{}}


\newcommand*\BibLaTeXSortingSpec{nty}
\DeclareOption{BibLaTeXsortingNone}{\renewcommand\BibLaTeXSortingSpec{none}}

\DeclareOption*{\ClassError{Phlab-thesis class passed unknown option: '\@ptionlist{\@currname.\@currext}'}{Nothing more to say.}}
\ProcessOptions\relax

%──────────  configure biblatex & hyperref  ──────────
\ifdefined\optHyperlinks
  \RequirePackage[hyperfootnotes=false]{hyperref}
  \hypersetup{colorlinks,citecolor=blue,filecolor=blue,linkcolor=blue,urlcolor=blue}


  % biblatex and cite are mutually exclusive
  % \textcite is supported by biblatex only, while \citet is supported by cite and natbib
  % To make it compatible with BibTex and cite package for IEEE template,
  % we set biblatex's natbib option to true so it treats \citet as an alias for \textcite
  % For IEEE Portal that only accepts BibTex, disable biblatex and use the style as follows:
  % \usepackage{cite}
  % \bibliographystyle{IEEEtran}

  % Note: we suppress doi, url, and eprint to keep it clean, feel free to enable them
  \RequirePackage[maxbibnames=99,natbib=true,style=ieee,citestyle=numeric-comp,sorting=\BibLaTeXSortingSpec,doi=false,url=false,eprint=false]{biblatex}
\else
  \RequirePackage[draft,hyperfootnotes=false]{hyperref}
  \RequirePackage[maxbibnames=99,natbib=true,style=ieee,citestyle=numeric-comp,sorting=\BibLaTeXSortingSpec,doi=false,url=false,eprint=false]{biblatex}
\fi

\renewbibmacro{in:}{}


\RequirePackage{graphicx}

\ifdefined\optWatermark
  \RequirePackage{eso-pic} %provides \AddToShipoutPicture
\fi



%\newcommand*\Chap[1]{\chapter*{#1}\AddToContents{#1}}
\newcommand*\退[1]{\hspace{-#1pt}}% Useful to manually adjust space between characters


\newcommand*\Degree{\ifdef{\PhD}{博士}{碩士}}

\newcommand*\UniversityTW{國立成功大學}
\newcommand*\UniversityEN{National Cheng Kung University}

\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\listtablename}{List of Tables}
\renewcommand{\bibname}{References}



\ifdefined\optWatermark
  \AddToShipoutPicture{%
    \put(0,0){%
      \parbox[b][\paperheight]{\paperwidth}{\vfill\centering%
        \includegraphics[]{NCKU-watermark-A4.pdf}%
        \vfill}}}
\fi
