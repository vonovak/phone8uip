%%
%% This is file `felthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% felthesis.dtx  (with options: `cls')
%% 
%% FELthesis: LaTeX class for bachelor, master and phd thesis
%% FELthesis.cls: class definition file
%% (c) 2012-2013 Vít Zýka, vit.zyka@seznam.cz
%%
%% 2012-10-27 v0.1 first version derived from CMPthesis
%% 2013-01-05 v0.2 bibname, otherlanguage*

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{felthesis}[2013/01/05 v0.2 (Vit Zyka)]

\def\FelThesis{\textsf{FELthesis}}
\def\ifEmpty#1{%
  \edef\tmp{#1}%
  \ifx\tmp\empty
}

\def\ifDraft{\ifdim\overfullrule>\z@\relax}

\def\Backslash{$\backslash$}

\long\def\@@expanded{}
\long\def\expanded#1{\long\xdef\@@expanded{\noexpand#1}\@@expanded}
\newif\ifBcl \Bcltrue
\newif\ifMsc \Mscfalse
\newif\ifPhd \Phdfalse
\newtoks\FelThThesis
\def\defBclThesis{\FelThThesis={\BclName}}
\def\defMscThesis{\FelThThesis={\MscName}}
\def\defPhdThesis{\FelThThesis={\PhdName}}
\defBclThesis

\newif\ifCzech \Czechfalse
\newif\ifSlovak \Slovakfalse
\newif\ifEnglish \Englishtrue

\newif\ifDraft \Draftfalse

\DeclareOption{bcl}{\Bcltrue\Mscfalse\Phdfalse \defBclThesis}
\DeclareOption{msc}{\Bclfalse\Msctrue\Phdfalse \defMscThesis}
\DeclareOption{phd}{\Bclfalse\Mscfalse\Phdtrue \defPhdThesis}
\DeclareOption{czech}{\Czechtrue\Slovakfalse\Englishfalse}
\DeclareOption{slovak}{\Czechfalse\Slovaktrue\Englishfalse}
\DeclareOption{english}{\Czechfalse\Slovakfalse\Englishtrue}
\DeclareOption{draft}{\Drafttrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions

%% --- load standard KOMA script class
\LoadClass
  [11pt, a4paper, twoside,
   headings=big, abstracton, appendixprefix=true,
   bibliography=totoc, index=totoc,
   cleardoublepage=empty, parskip=false]
  {scrreprt}

\RequirePackage[automark]{scrpage2}
\typearea[25mm]{14}
\advance\footskip by-\baselineskip
\advance\topmargin by3mm
\columnsep=2em

\RequirePackage{lmodern} % Latin Modern font

\RequirePackage[T1]{fontenc}
\RequirePackage{cmap}
\RequirePackage[utf8]{inputenc}
\RequirePackage[czech,slovak,english]{babel}
\AtBeginDocument{
  \ifCzech\selectlanguage{czech}\fi
  \ifSlovak\selectlanguage{slovak}\fi
}

\RequirePackage{ifpdf}

\ifpdf
  \RequirePackage[pdftex,final]{xcolor,graphicx}
  \definecolor{lgray}{gray}{.9}
  \definecolor{dgreen}{rgb}{0,0.4,0}
  \definecolor{dblue}{rgb}{0,0,0.5}
  \definecolor{dred}{rgb}{0.4,0,0}
\else
  \RequirePackage[final]{xcolor,graphicx}
\fi

\ifpdf
  \usepackage[pdftex,final]{hyperref}
  \hypersetup{colorlinks,pdfhighlight=/O,citecolor=black,unicode=true,
     filecolor=black,urlcolor=black,linkcolor=black,%pagecolor=black,
     breaklinks=true,pdfpagemode=UseNone,plainpages=false,
     %backref=true,pagebackref=true
  }
  %\ifDraft
  %  \hypersetup{citecolor=dgreen,
  %     filecolor=dblue,urlcolor=dblue,linkcolor=dred,%pagecolor=dred,
  %  }
  %\fi
\fi

\RequirePackage[backend=biber,style=numeric,sorting=none]{biblatex}

\RequirePackage{amsmath}
\RequirePackage{amssymb}

\RequirePackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{equation}{chapter}

%%\RequirePackage[small]{caption2}
%%  \renewcommand*\captionlabelfont{\sfb}
%%  \renewcommand*\captionlabeldelim{}
%%  %\renewcommand*\captionformat{\ } % does not operate!
%%  \captionindent=\parindent
\addtokomafont{caption}{\small}
\addtokomafont{captionlabel}{\sfb}
\renewcommand*{\captionformat}{~~}
\setcapindent{\parindent}

\RequirePackage{subfigure}
  \def\subfigtopskip{5pt}             % subfigure spacing
  \def\subfigbottomskip{0pt}
  \def\subfigcapskip{2pt}
  \def\subfigcapmargin{5pt}
  \def\thesubfigure{\alph{subfigure}} % subfigure referencing
  \def\@thesubfigure{{\sfb\thesubfigure)\space}\raggedright}
  \def\p@subfigure{\thefigure}

\RequirePackage{makeidx}\makeindex
%%\RequirePackage{wrapfig}
%%\RequirePackage{wideenv}
%%\RequirePackage{ifrpage}
\RequirePackage{url}

\RequirePackage{pdfpages} % to include assignment page

\iffalse % tty to set \parskip=\baselineskip
\renewcommand*{\chapterheadstartvskip}{\vspace*{2.3\baselineskip}}
\renewcommand*{\chapterheadendvskip}{%
    \vspace{0.725\baselineskip
      \@plus .115\baselineskip \@minus .192\baselineskip}%
}

\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus.2ex}%
  {\ifnum \scr@compatibility>\@nameuse{scr@v@2.96}\relax
    \setlength{\parfillskip}{\z@ plus 1fil}\fi
    \raggedsection\normalfont\sectfont\nobreak\size@section
  }%
}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\ifnum \scr@compatibility>\@nameuse{scr@v@2.96}\relax
    \setlength{\parfillskip}{\z@ plus 1fil}\fi
    \raggedsection\normalfont\sectfont\nobreak\size@subsection
  }%
}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\ifnum \scr@compatibility>\@nameuse{scr@v@2.96}\relax
    \setlength{\parfillskip}{\z@ plus 1fil}\fi
    \raggedsection\normalfont\sectfont\nobreak\size@subsubsection
  }%
}
\fi
\def\KeywordsNameCz{Klíčová slova}
\def\KeywordsNameSk{Kĺúčová slová}
\def\KeywordsNameEn{Keywords}

\def\CzLabels{%
  \def\AcknowledgementName{Poděkování}
  \def\DeclarationName{Prohlášení}
  \def\AbstractName{Abstrakt}
  \def\KeywordsName{\KeywordsNameCz}
  \def\AbbrvName{Zkratky}
  \def\TableName{Tab.}
  \def\FigureName{Obr.}
  \def\BclName{bakalářská práce}
  \def\MscName{diplomová práce}
  \def\PhdName{disertační práce}
  \def\AppendicisName{Přílohy}
  \def\bibname{Literatura}
}

\def\SkLabels{%
  \def\AcknowledgementName{Poděkování}
  \def\DeclarationName{Prohlášení}
  \def\AbstractName{Abstrakt}
  \def\KeywordsName{\KeywordsNameSk}
  \def\AbbrvName{Zkratky}
  \def\TableName{Tab.}
  \def\FigureName{Obr.}
  \def\BclName{bakalářská práce}
  \def\MscName{diplomová práce}
  \def\PhdName{disertační práce}
  \def\AppendicisName{Přílohy}
  \def\bibname{Literatúra}
}

\def\EnLabels{%
  \def\AcknowledgementName{Acknowledgement}
  \def\DeclarationName{Declaration}
  \def\AbstractName{Abstract}
  \def\KeywordsName{\KeywordsNameEn}
  \def\AbbrvName{Abbreviations}
  \def\TableName{Tab.}
  \def\FigureName{Fig.}
  \def\BclName{bachelor's thesis}
  \def\MscName{master's thesis}
  \def\PhdName{ph.d. thesis}
  \def\AppendicisName{Appendices}
  \def\bibname{Bibliography}
}

\def\SchoolCz{České vysoké učení technické v~Praze}
\def\SchoolEn{Czech Technical University in Prague}

\def\FacultyCz{Fakulta elektrotechnická}
\def\FacultyEn{Faculty of Electrical Engineering}

\EnLabels % default

\def\AddToCaption#1{%
  \addto#1{%
    \let\tablename=\TableName
    \let\figurename=\FigureName
  }%
}

\def\AddToCaptions{%
  \AddToCaption\captionsczech
  \AddToCaption\captionsslovak
  \AddToCaption\captionsenglish
}

\AtBeginDocument{%
  \ifCzech\CzLabels\fi
  \ifSlovak\SkLabels\fi
  \ifEnglish\EnLabels\fi
  \AddToCaptions
}
\def\startThesisInfo{%
  \bgroup
    \def\Title{\global\FelThTitle}
    %\def\Title{\afterassignment\setStandardTitle\global\FelThTitle}
    %\def\setStandardTitle{\title{\theTitle}}
    \def\Author{\global\FelThAuthor}
    %\def\Author{\afterassignment\setStandardAuthor\global\FelThAuthor}
    %\def\setStandardAuthor{\author{\theAuthor}}
    \def\AuthorEmail{\global\FelThAuthorEmail}
    \def\ThesisUrl{\global\FelThThesisUrl}
    \def\Date{\global\FelThDate}
    \def\Advisor{\global\FelThAdvisor}
    \def\School{\global\FelThSchool}
    \def\Faculty{\global\FelThFaculty}
    \def\Department{\global\FelThDepartment}
    \def\KeywordsCz{\global\FelThKeywordsCz}
    \def\KeywordsEn{\global\FelThKeywordsEn}
    \def\AssignmentPage{\global\FelThAssignmentPage}
    \ifEnglish
      \School{\SchoolEn}\Faculty{\FacultyEn}
    \else
      \School{\SchoolCz}\Faculty{\FacultyCz}
    \fi
}
\def\stopThesisInfo{%
  \egroup
}

\newtoks\FelThTitle
\newtoks\FelThAuthor
\newtoks\FelThAuthorEmail
\newtoks\FelThThesisUrl
\newtoks\FelThDate
\newtoks\FelThAdvisor
\newtoks\FelThSchool
\newtoks\FelThFaculty
\newtoks\FelThDepartment
\newtoks\FelThKeywordsCz
\newtoks\FelThKeywordsEn
\newtoks\FelThAssignmentPage

\def\theTitle{\the\FelThTitle}
\def\theAuthor{\the\FelThAuthor}
\def\theAuthorEmail{\the\FelThAuthorEmail}
\def\theThesis{\the\FelThThesis}
\def\theThesisUrl{\the\FelThThesisUrl}
\def\theDate{\the\FelThDate}
\def\theAdvisor{\the\FelThAdvisor}
\def\theSchool{\the\FelThSchool}
\def\theFaculty{\the\FelThFaculty}
\def\theDepartment{\the\FelThDepartment}
\def\theKeywordsCz{\the\FelThKeywordsCz}
\def\theKeywordsEn{\the\FelThKeywordsEn}
\def\theAssignmentPage{\the\FelThAssignmentPage}

\def\TypeAssignmentPage{%
  \ifEmpty{\theAssignmentPage}\else\includepdf{\theAssignmentPage}\fi
}

\def\SetPdfCatalogInfo{%
  \ifpdf
    \expanded{%
    \hypersetup{%
      pdftitle={\theTitle},
      pdfauthor={\theAuthor},
      pdfsubject={\theThesis},
      pdfkeywords={\theKeywordsEn},
    }}%
  \fi
}

\AtBeginDocument{\SetPdfCatalogInfo}

\let\Subtitle=\subtitle
\def\MakeTitle{\maketitle} % title starts at page #3
\renewcommand*\maketitle[1][1]{%
    \begin{titlepage}
      \setcounter{page}{#1}%
      \let\footnotesize\small
      \let\footnoterule\relax
      \let\footnote\thanks
      \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
      \let\@oldmakefnmark\@makefnmark
      \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}%
      \ifx\@extratitle\@empty \else
        \noindent\@extratitle\next@tpage\cleardoubleemptypage
        \thispagestyle{empty}%
      \fi
      \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
      \ifx\@titlehead\@empty \else
        \begin{minipage}[t]{\textwidth}%
        \@titlehead
        \end{minipage}\par
      \fi
      \null\vfill
      \begin{center}
        \vskip \z@ \@plus1fill
        \ifx\@subject\@empty \else
          {\subject@font \@subject \par}%
          \vskip 2em
        \fi
        {\titlefont\@title\par}%
        \vskip 1em
        {\ifx\@subtitle\@empty\else\usekomafont{subtitle}\@subtitle\par\fi}%
        \vskip 3em
        {\Large\itshape \lineskip 0.75em
          \begin{tabular}[t]{c}
            \@author
          \end{tabular}\par
        }%
        \vskip \z@ \@plus3fill
        {\Large \@date \par}%
        \vskip \z@ \@plus1fill
        {\Large \@publishers \par}%
        %\vskip 3em
      \end{center}\par
      \vskip-2\baselineskip%\vfill
      \null
    \end{titlepage}
  \setcounter{footnote}{0}%
  \let\thanks\relax
  \let\maketitle\relax
  \let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@subtitle\@empty
  \global\let\@extratitle\@empty
  \global\let\@titlehead\@empty
  \global\let\@subject\@empty
  \global\let\@publishers\@empty
  \global\let\@uppertitleback\@empty
  \global\let\@lowertitleback\@empty
  \global\let\@dedication\@empty
  \global\let\author\relax
  \global\let\title\relax
  \global\let\extratitle\relax
  \global\let\titlehead\relax
  \global\let\subject\relax
  \global\let\publishers\relax
  \global\let\uppertitleback\relax
  \global\let\lowertitleback\relax
  \global\let\dedication\relax
  \global\let\date\relax
  \global\let\and\relax
}%

\AtBeginDocument{
  \titlehead{% top
    %\vskip10\BL
  }
  \subject{\theThesis}
  \title{%
    \theTitle
  }
  \subtitle{}
  \author{\theAuthor}
  \date{%
    \includegraphics[width=4cm]{lev}%
  }
  \publishers{% bottom
        \theDate\\[2\BL]
        \theAdvisor\\[1\BL]
        \theSchool\\[.5ex]
        \theFaculty, \theDepartment\par
  }
}

\setkomafont{title}{%
  \normalfont\normalcolor\sffamily\bfseries\fontsize{20pt}{32pt}\selectfont
}
\setkomafont{subject}{%
  \normalfont\normalcolor\Large\selectfont
}

\newdimen\tmpd
\newdimen\tmpD
\newdimen\Tmpd
\newdimen\TmpD

\newcount\tmpc
\newcount\tmpC
\newcount\Tmpc
\newcount\TmpC

\newbox\tmpb
\newbox\tmpB
\newbox\Tmpb
\newbox\TmpB
\pagestyle{scrheadings}

\def\ProofInfo{}

\ifDraft
  \def\ProofInfo{{\normalfont\ttfamily Draft: \today}}
\fi

\lofoot[\ProofInfo]{\ProofInfo}
\refoot[\ProofInfo]{\ProofInfo}
\def\startFrontMatter{%
  \def\thepage{\roman{page}}
  \pagestyle{scrplain}
}

\def\stopFrontMatter{%
}

\def\startBodyMatter{%
  \cleardoublepage
  \setcounter{page}{1}
  \def\thepage{\arabic{page}}
  \pagestyle{scrheadings}
}

\def\stopBodyMatter{%
}

\def\startBackMatter{%
}

\def\stopBackMatter{%
}

\def\startAppendices{%
  \appendix
  \bgroup
    \let\origwrite=\write
    \def\write{\immediate\origwrite}%
    \addtocontents{toc}{\protect\contentsline{chapter}{\AppendicisName}{}{}}%
  \egroup
}

\def\stopAppendices{%
}
\def\startAcknowledgement{%
  \cleardoublepage
  \section*{\AcknowledgementName}
}

\def\stopAcknowledgement{%
}
\def\startDeclaration{%
  \vfill
  \section*{\DeclarationName}
}

\def\stopDeclaration{%
}
\def\startAbstractCz{%
  \clearpage
  \bgroup
  %\selectlanguage{czech}
  \begin{otherlanguage*}{czech}
  \section*{\AbstractName}
}

\def\stopAbstractCz{%
  \typeKeywords{\KeywordsNameCz}{\theKeywordsCz}
  \par
  \end{otherlanguage*}
  \egroup
}

\def\startAbstractSk{%
  \clearpage
  \bgroup
  %\selectlanguage{slovak}
  \begin{otherlanguage*}{slovak}
  \section*{\abstractname}
}

\def\stopAbstractSk{%
  \typeKeywords{\KeywordsNameSk}{\theKeywordsCz}
  \par
  \end{otherlanguage*}
  \egroup
}

\def\startAbstractEn{%
  \clearpage
  \bgroup
  %\selectlanguage{english}
  \begin{otherlanguage*}{english}
  \section*{\abstractname}
}

\def\stopAbstractEn{%
  \typeKeywords{\KeywordsNameEn}{\theKeywordsEn}
  \par
  \end{otherlanguage*}
  \egroup
}

\def\typeKeywords#1#2{%
  \subsection*{#1}
  #2\par
}
\newdimen\AbbrvIndent \AbbrvIndent=7em
\newdimen\AbbrvSep    \AbbrvSep=1em

\def\startAbbreviations{%
  \@ifnextchar*{\bigskip\dostartAbbreviations}{\clearpage\dostartAbbreviations*}%
}
\def\dostartAbbreviations*{%
  \@ifnextchar[{\dodostartAbbreviations}{\dodostartAbbreviations[\AbbrvName]}%
}
\def\dodostartAbbreviations[#1]#2{%
  \section*{#1}
  \ifEmpty{#2}\else#2\par\medskip\fi
  \list{}{\bgroup
    \labelwidth=\z@ \labelsep=\z@
    \leftmargin\AbbrvIndent \itemindent-\leftmargin \setgenlistparam
    \def\makelabel##1{%
      \setbox\Tmpb=\hbox{%
        \normalfont%\sffamily\bfseries
        ##1\hskip\AbbrvSep}%
      \ifdim\wd\Tmpb>\AbbrvIndent\Tmpd=\wd\Tmpb \else\Tmpd=\AbbrvIndent \fi
      \hbox to\Tmpd{\unhbox\Tmpb\hfill}}%
    \let\abbrv\item}
}

\def\stopAbbreviations{%
  \endgraf\egroup\endlist
}
\setcounter{tocdepth}{3} % content has chapters, sections, and subsections

\def\TableOfContents{\tableofcontents}
\deftocheading{toc}{%
  \clearpage
  \section*{\contentsname}%
  \@mkboth{\contentsname}{\contentsname}%
}
\def\PrintBibliography{%
  \clearpage
  \addcontentsline{toc}{chapter}{\bibname}
  \printbibliography
}
\def\PrintIndex{%
  \clearpage
  \addcontentsline{toc}{chapter}{\indexname}
  \printindex
}
\setcounter{topnumber}{10}
\setcounter{bottomnumber}{10}
\setcounter{totalnumber}{10}
\setcounter{dbltopnumber}{10}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.85}
\renewcommand{\dbltopfraction}{0.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.75}
\renewcommand{\dblfloatpagefraction}{0.75}

\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{16\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}

\def\HLine{\noalign{\vskip.2em}\hline\noalign{\vskip1ex}}
\def\HHLine{\noalign{\vskip.2em}\hline\hline\noalign{\vskip1ex}}
\newdimen\GenericParIndent \GenericParIndent=1.5em

\def\setgenlistparam{%
  \setlength{\itemsep}{0pt}\setlength{\parsep}{0pt plus2pt}%
  \setlength{\topsep}{0pt}\setlength{\parskip}{0pt plus2pt}}

%% itemize
\setlength\leftmargini{\parindent}
\def\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\hss\llap{##1}}%
       \setgenlistparam\setlength\leftmargin{1.5\GenericParIndent}}%
  \fi}

%% enumerate
\def\enumerate{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \expandafter
      \list
        \csname label\@enumctr\endcsname
        {\usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}%
         \setgenlistparam\setlength\leftmargin{1.5\GenericParIndent}}%
  \fi}

%% description
\renewenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin \setgenlistparam
           \let\makelabel\descriptionlabel}}
  {\endlist}
\def\Emph#1{{\sffamily\bfseries#1\/}}

\newdimen\LW \let\LW\linewidth
\newdimen\BL \let\BL\baselineskip

\def\Mref#1{(\ref{#1})}
\def\Fref#1{\FigureName~\ref{#1}}
\def\Tref#1{\TableName~\ref{#1}}
\endinput
%%
%% End of file `felthesis.cls'.
