%%
%% LaTeX class file for VCI themed master's and bachelor's thesis.
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2016/04/08 VCI Thesis Template]

 %% Fallback
\DeclareOption*{
    \ClassWarning{thesis}{Unknown option '\CurrentOption'}
}

\ProcessOptions\relax

\LoadClass[12pt,twoside,a4paper]{book}

\RequirePackage{etoolbox}
\RequirePackage[utf8]{inputenc}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[pass]{geometry}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{textcomp}
\RequirePackage{bm}
\RequirePackage{commath}
\RequirePackage{dsfont}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{verbatim}
\RequirePackage[citestyle=ieee-alphabetic,bibstyle=alphabetic,sorting=nyt,hyperref=auto,maxcitenames=3,maxbibnames=99,backref=true]{biblatex}
\RequirePackage[font=small,margin=0em,labelfont=bf]{caption}
\RequirePackage[inline,shortlabels]{enumitem}
\RequirePackage[capitalise]{cleveref}
\RequirePackage{makeidx}
\RequirePackage{tikz}
\RequirePackage{thesis-macros}
\RequirePackage{thesis-hyphenation}
\RequirePackage{appendix}
\RequirePackage{times}
\RequirePackage{siunitx}
\RequirePackage{caption} 
\RequirePackage{subcaption} 

\usetikzlibrary{calc,arrows.meta}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Some global settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeindex

\bibliography{bibliography/references}
\DefineBibliographyStrings{english}{%
  backrefpage = {cited on page},
  backrefpages = {cited on pages},
}

\theoremstyle{plain}% default
\newtheorem{thm}{Theorem}[chapter]
\newtheorem{lem}[thm]{Lemma}
\newtheorem{cor}{Corollary}[chapter]

\setlength{\headheight}{14.5pt}
\lhead[\fancyplain{}{\thepage}]{\fancyplain{}{\nouppercase{\rightmark}}}
\rhead[\fancyplain{}{\nouppercase{\leftmark}}]{\fancyplain{}{\thepage}}
\cfoot[\fancyplain{\thepage}{}]{\fancyplain{\thepage}{}}

\pagestyle{fancyplain}

% no single lines separated from paragraphs
\widowpenalty10000
\clubpenalty10000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters for title page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\thesisTitle#1{\gdef\@thesisTitle{#1}}
\def\@thesisTitle{\@latex@warning@no@line{No \noexpand\thesisTitle given.}{\texttt{\color{red}[No \textbackslash{}thesisTitle given.]}}}

\def\thesisType#1{\gdef\@thesisType{#1}}
\def\@thesisType{\@latex@warning@no@line{No \noexpand\thesisType given.}{\texttt{\color{red}[No \textbackslash{}thesisType given.]}}}

\def\thesisAuthor#1{\gdef\@thesisAuthor{#1}}
\def\@thesisAuthor{\@latex@warning@no@line{No \noexpand\thesisAuthor given.}{\texttt{\color{red}[No \textbackslash{}thesisAuthor given.]}}}

\def\thesisStudentID#1{\gdef\@thesisStudentID{#1}}
\def\@thesisStudentID{\@latex@warning@no@line{No \noexpand\thesisStudentID given.}{\texttt{\color{red}[No \textbackslash{}thesisStudentID given.]}}}

\def\thesisMonth#1{\gdef\@thesisMonth{#1}}
\def\@thesisMonth{\@latex@warning@no@line{No \noexpand\thesisMonth given.}{\texttt{\color{red}[No \textbackslash{}thesisMonth given.]}}}

\def\thesisPrimaryReviewer#1{\gdef\@thesisPrimaryReviewer{#1}}
\def\@thesisPrimaryReviewer{\@latex@warning@no@line{No \noexpand\thesisPrimaryReviewer given.}{\texttt{\color{red}[No \textbackslash{}thesisPrimaryReviewer given.]}}}

\def\thesisSecondaryReviewer#1{\gdef\@thesisSecondaryReviewer{#1}}
\def\@thesisSecondaryReviewer{\@latex@warning@no@line{No \noexpand\thesisSecondaryReviewer given.}{\texttt{\color{red}[No \textbackslash{}thesisSecondaryReviewer given.]}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\makeTitle}{%
\newgeometry{left=3.5cm,right=2.5cm,top=4cm,bottom=2.5cm}
\begin{titlepage}
\parindent0pt
\parskip0pt
\tikz[remember picture, overlay]
  \node[inner sep=1cm, outer sep=0pt, below left] at (current page.north east) {
    \includegraphics[height=2cm]{rwth-vci-logo}};
\begin{centering}
  {\footnotesize
  The present work was submitted to the\\
  \vspace*{.75cm}
  Visual Computing Institute\par
  Faculty of Mathematics, Computer Science and Natural Sciences\par
  RWTH Aachen University\par}
  \vspace*{\stretch{2}}\par
  {\LARGE\bfseries\@thesisTitle\par}
  \vspace*{.75cm}
  {\bfseries\@thesisType\par}

  \vspace*{.75cm}
  presented by\par
  \vspace*{.75cm}
  {\@thesisAuthor\par}
  {\small Student ID Number \@thesisStudentID}\par

  \vspace*{.75cm}
  \@thesisMonth

  \vspace*{\stretch{2}}
  \begin{tabular}{ll}
  First Examiner: &\@thesisPrimaryReviewer\\
  Second Examiner: &\@thesisSecondaryReviewer\\
  \end{tabular}\par
\end{centering}
\eject
\thispagestyle{empty}
\end{titlepage}
\restoregeometry
} %\makeTitle

\newcommand{\makeFrontMatter}{
\frontmatter
\makeTitle
\begin{abstract}
    \paragraph{Abstract.}
    In computer graphics, physics-based simulation is an essential tool for accurately capturing the behavior of non-linear materials 
    like rubber and biological tissue. Simulation methods that are suitable for real-time applications trade accuracy and generality for speed. 
    These tradeoffs often make it difficult to achieve robust simulations for challenging scenarios with large material stiffness and when 
    direct control over individual particle positions is required. Popular methods for real-time physics-based simulation are XPBD \cite{macklin2016},
    Projective Dynamics (PD) \cite{bouaziz2014} and its extensions using Quasi-Newton methods (QN) \cite{liu2017} and the Alternating Direction 
    Method of Multipliers (ADMM) \cite{overby2017}. Despite their popularity, comparisons between simulation methods are usually only conducted for 
    simple material models and low material stiffness. We address this gap by providing a detailed comparison between XPBD and PD-style simulation 
    methods across a variety of settings using a wide range of material models, material stiffness values and time step sizes. Most importantly, we 
    show that PD-style simulation methods are more robust than XPBD for simulations with competing energy terms and that robust simulations using 
    stiff Neohookean materials can only be achieved using the QN method.
    \end{abstract}
\cleardoublepage
{%
\pagestyle{plain}
\include{affirmation}
\cleardoublepage
}
{%
\tableofcontents
\cleardoublepage
}
} %\makeFrontMatter

\endinput
