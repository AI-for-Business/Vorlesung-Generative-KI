%%% Options
%%%% We now pass the options of the class
\newcommand{\main@definetheme}[2]{\@namedef{main@theme@#1}{#2}}
\newcommand{\usetheme}[1]{\@nameuse{main@theme@#1}}
% \newcommand{\logo}{/Users/dominik-cau/Documents/Lernen/Uni/Promotion/Vorlagen/Bayreuth/Exercise/UBT_Logo.pdf}
\newcommand{\logo}{UBT_Logo.pdf}

\main@definetheme{light-theme}{%
	\pagecolor[rgb]{1,1,1} %black
	\color[rgb]{0,0,0} %grey
	% \renewcommand{\logo}{/Users/dominik-cau/Documents/Lernen/Uni/Promotion/Vorlagen/Bayreuth/Exercise/UBT_Logo.pdf}
    \renewcommand{\logo}{UBT_Logo.pdf}
}

\main@definetheme{dark-theme}{%
	\pagecolor[rgb]{0.251,0.251,0.251} %black
	\color[rgb]{1,1,1} %grey
	\renewcommand{\logo}{/Users/dominik-cau/Documents/Lernen/Uni/Promotion/Vorlagen/Bayreuth/Exercise/UBT_Logo_darkmode.png}
}

% Do not use two coloumn
\DeclareOption{twocolumn}{\OptionNotUsed}
\PassOptionsToClass{a4paper}{article}
\DeclareOption{english}{\AtEndOfClass{\main@language{english}}}
\DeclareOption{ngerman}{\AtEndOfClass{\main@language{ngerman}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\RequirePackage[ngerman, english]{babel}

% We need to load 
\LoadClass{article}
\usepackage{lmodern}
\usepackage[T1]{fontenc}
\usepackage[shortlabels]{enumitem}
\usepackage{ifthen}
\usepackage[table,xcdraw]{xcolor}
\usepackage{amsmath}

%% For Checkboxes
\usepackage{enumitem,amssymb}
\newlist{todolist}{itemize}{2}
\setlist[todolist]{label=$\square$}

%%% Identification
\NeedsTeXFormat{LaTeX2e} % we need to have LaTeX2e for this to compile
\ProvidesClass{/Users/dominik-cau/Documents/Lernen/Uni/Promotion/Vorlagen/Exercise-Sheets/Latex/AssignmentClass}% fpshw is the name we need to provide to 
% the documentclass command on the .tex file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{multicol}
%\RequirePackage{babel}
\usepackage[english,ngerman]{babel}
\usepackage{iflang}
%% Tables
\usepackage{array}
\usepackage{multirow}
\usepackage{tabularx}
% for prettier tables
\usepackage{booktabs}
\usepackage{hyperref}
% Header and footers, we will use the titles also
\RequirePackage{fancyhdr}
\usepackage{xcolor}
\usepackage{tikz}
\usepackage{float}
\usepackage{comment}
%%% Preliminary declarations:
%%%% These are some commands where we declare new commands for the class

% We define the macro for the name of the course
\newcommand{\class}[1]{ \newcommand{\classloc}{#1} }
\newcommand{\term}[1]{ \newcommand{\termlocal}{#1} }
\newcommand{\instructor}[1]{ \newcommand{\instructorlocal}{#1} }
\newcommand{\topics}[1]{ \newcommand{\topicslocal}{#1} }

%\newboolean{bool_english}
%\setboolean{bool_english}{true}
%\newcommand{\setlanguageGerman}{\setboolean{english}{false}}
%\newcommand{\setlanguageEnglish}{\setboolean{english}{true}}
%\ifthenelse{\equal{bool_english}{true}}{\selectlanguage{ngerman}}{\selectlanguage{english}}


\IfLanguageName{ngerman}{
%	\newcommand{\logo}{/Users/dominik-cau/Documents/Lernen/Uni/Promotion/Lehre/Latex-Vorlage/CAU-logo-en.png}
	\newcommand{\institute}{Lehrstuhl für Process Analytics}
	}{
%	\newcommand{\logo}{/Users/dominik-cau/Documents/Lernen/Uni/Promotion/Lehre/Latex-Vorlage/CAU-logo-de.png}
	\newcommand{\institute}{Lehrstuhl für Process Analytics}
	}

\newcommand{\professor}{Prof. Dr. Agnes Koschmider}
\author{Dominik Janssen} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set pfd MetaData
\hypersetup{
	pdfauthor   = {\@author},
	pdfcreator  = {pdflatex},
	pdfproducer = {LaTeX with hyperref}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Bulk Declarations
%%%% Here we do more declarations and call other files

% we will modify sections, subsections and sub subsections
\RequirePackage{titlesec}
% Modification of section 
\IfLanguageName{ngerman}{
	\titleformat{\section}[block]{\bfseries \large \flushleft}{Exercise \thesection: }{0pt}{}[]
	
}{
	\titleformat{\section}[block]{\bfseries \large \flushleft}{Aufgabe \thesection: }{0pt}{}[]
}
% modification of subsection 
\IfLanguageName{ngerman}{
	\titleformat{\subsection}[block]{\bfseries \flushleft}{Solution}{1mm}{}[\quad]
}{
	\titleformat{\subsection}[block]{\bfseries \flushleft}{Lösung}{1mm}{}[\quad]
}


%and sub sub section

\titleformat{\subsubsection}[runin]{\bfseries\itshape}{\thesubsubsection.}
{1mm}{}[\quad]

% Geometry lets us modify the sizes of the document nicely
\RequirePackage{geometry}
% Decent margins for the documents, as it is meant to be printed
\geometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm}

\fancyhead{}
\fancyfoot{}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.4pt} % we want rules 
\renewcommand{\footrulewidth}{0.4pt}
\fancyhead[RO] {\footnotesize\thepage}
\fancyhead[LO] {\footnotesize{\ifx\classloc\undefined{}\else\itshape\classloc{} --{} \fi}\makeatletter\@title\makeatother}
\fancyfoot[RO] {\footnotesize\itshape\makeatletter\termlocal\makeatother}

% New title style for the document
\renewcommand{\maketitle}{%
	\thispagestyle{plain}
	\begin{multicols}{2}
		\begin{flushleft}

			\textbf{\scshape \institute}
						
			\professor \\
			\vspace{1pt}
			\instructorlocal
			\vspace{2pt}
		\end{flushleft}
		\columnbreak
		\columnbreak
		\begin{flushright}
			\includegraphics[height=1.75cm]{\logo} \\

		\end{flushright}
		
	\end{multicols}
	\begin{center}
		\hrule
		\vspace{6pt}
		\textbf{\LARGE {\classloc}} \\
		[2pt]
		\small{\termlocal} \\
		\vspace{6pt}
		\textbf{\large{\@title}}\\
		\vspace{2pt}
		\small{\topicslocal}
		\vspace{6pt}
		\hrule
		\vspace{8pt}
	\end{center}
}

%% End class with this command
\endinput
