%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dokumentenklasse für Transferleistungen
% erstellt am 5.01.2021
% Version: v2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{common/nak}[]

\newif\iflnienglish\lnienglishfalse
\DeclareOption{english}{\lnienglishtrue}

\ProcessOptions

\LoadClass[a4paper,oneside,12pt, enabledeprecatedfontcommands, bibliography=totocnumbered]{scrartcl}
%times in 12 pt
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
%Zeilenabstrand 1.25
\RequirePackage{setspace}
\setstretch{1.25}
%Seitenabstand
\RequirePackage[margin=2cm, includefoot, heightrounded]{geometry}
\RequirePackage{microtype}
\RequirePackage[backend=biber,style=ieee,sorting=none]{biblatex}
\RequirePackage[table]{xcolor}
%Language
\RequirePackage[english,ngerman,german]{babel}
\iflnienglish\selectlanguage{english}\def\bbl@main@language{english}\fi

%Url-Config
\PassOptionsToPackage{hyphens}{url}
\RequirePackage[hyperfootnotes=false]{hyperref}

%Tikz-Import
\RequirePackage{tikz}
\usetikzlibrary{fadings}

%Math
\RequirePackage{mathptmx}

%Titel und Ueberschriften ebenfalls in Times statt KOMA-Default (Sans Serif)
\addtokomafont{disposition}{\rmfamily}

%Graphicx
\RequirePackage{graphicx}

%Bild unterschriften
\RequirePackage{caption}
\RequirePackage{subcaption}

%Listen
\RequirePackage{listings}

%Bunter Code (z.B.)
\RequirePackage{color}

%Mehrfach Footnote
\RequirePackage[multiple]{footmisc}

%Tabellen
\RequirePackage{tabularx}

%Figuren im Text
\RequirePackage{wrapfig}

%pdf im text
\RequirePackage{pdfpages}
\RequirePackage[export]{adjustbox}

%Nordakademie Head
\RequirePackage{fancyhdr}
\addtolength{\headheight}{0.9cm}
\pagestyle{fancyplain}
\fancyhead[R]{\includegraphics[height=0.9cm]{images/Nordakademie_Logo.png}}
\fancyhead[L]{NORDAKADEMIE Hochschule der Wirtschaft}

%Pagestyles

\newcommand{\absatz}{
    \\\noindent
}

\newcommand{\needCite}[1][]{
    \@latex@warning{Still require cite: #1! Needs to be done}
    \colorbox{yellow}{\textcolor{red}{Cite Notwendig #1}}%
}

\newcommand{\todo}[1]{
    \textcolor{red}{TODO: #1}%
    \@latex@warning{TODO: #1! Needs to be done}%
}

\newcommand{\anf}[1]{\glqq #1\grqq{}}
\newcommand{\anfo}[1]{\glqq #1\grqq}

\newcommand{\fullref}[1]{\ref{#1} \anf{\nameref{#1}}}

\RequirePackage{minted}
%Zitate
\RequirePackage{csquotes}

\RequirePackage{float}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Konfiguration der Codestyles%
%   kann erweitert werden    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setminted[js]{ %
    linenos=true,             % Line numbers
    autogobble=true,          % Automatically remove common white space
    frame=lines,
    framesep=2mm,
    fontsize=\footnotesize
}

\setminted[abap]{ %
    linenos=true,             % Line numbers
    autogobble=true,          % Automatically remove common white space
    frame=lines,
    framesep=2mm,
    fontsize=\footnotesize
}

\setminted[xml]{ %
    linenos=true,             % Line numbers
    autogobble=true,          % Automatically remove common white space
    frame=lines,
    framesep=2mm,
    fontsize=\footnotesize
}

\setminted[json]{ %
    linenos=true,             % Line numbers
    autogobble=true,          % Automatically remove common white space
    frame=lines,
    framesep=2mm,
    fontsize=\footnotesize
}

\setminted[java]{ %
    linenos=true,             % Line numbers
    autogobble=true,          % Automatically remove common white space
    frame=lines,
    framesep=2mm,
    fontsize=\footnotesize
}

\makeatletter
\newenvironment{codeBlock}[3]
 {\RecustomVerbatimEnvironment{Verbatim}{BVerbatim}{}%
  \def\FV@BProcessLine##1{%
    \hbox{%
      \hbox to\z@{\hss\theFancyVerbLine\kern\FV@NumberSep}%
      \FancyVerbFormatLine{##1}%
    }%
  }%
  \VerbatimEnvironment
  \begin{listing}[H]%
  \centering%
  \caption{#2}%
  \label{#3}%
  \setbox\z@=\hbox\bgroup
  \begin{minted}[samepage]{#1}}
 {\end{minted}\egroup
  \leavevmode\vbox{\hrule\kern2mm\box\z@\kern2mm\hrule}
  \end{listing}\noindent
 }
\makeatother

\usemintedstyle{lovelace}
\usemintedstyle[abap]{abap}

\renewcommand\listingscaption{Codebeispiel}
\newcommand*{\listingautorefname}{\listingscaption}

