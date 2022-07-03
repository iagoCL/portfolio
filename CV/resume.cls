%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addressone}{
    \def \@addressone {#1}
  }{
  \@ifundefined{@addresstwo}{
  \def \@addresstwo {#1}
  }{
     \def \@addressthree {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the mainSection environment for the large sections within the CV
\newenvironment{mainSection}[1]{ % 1 input argument - section name
%\vspace{0.17em}
\addvspace{0.07em}  
  \MakeUppercase{\bf #1} % Section title
  \hrule % Horizontal line
  \addvspace{0.03em}
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{0.7em} % Margin within the section
  }
\item[]}{
\end{list}
}

\newenvironment{customItemList}{
\begin{list}{$\bullet$}{\leftmargin=1.15em \labelsep=0.2em \itemindent=0em \itemsep=0mm \parsep=0pt \topsep=0pt \partopsep=0pt \parindent=0.3cm \parskip=0.0em}}{
\end{list}
}
%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{multiWorkExperience}[5]{ % 4 input arguments - job title, date, company name, company location

\underline{\textbf{#1}} - \textbf{#2}, \textit{#3} \hfill  {\textit{#4}-\textit{#5}}% Bold company name and date on the right
\begin{customItemList}
}{
\end{customItemList}
}

%----------------------------------------------------------------------------------------
%	EDUCATION FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{educationItem}[5]{ % 4 input arguments - title, start year, end year, university, university location

\underline{\textbf{#1}}  \hfill {\textit{#2}-\textit{#3}}% Bold company name and date on the right
\\
\setlength{\parindent}{0em}
\textit{#4}, #5.
%\setlength{\parindent}{0.3cm}
%\setlength{\parskip}{0em}
\begin{customItemList}
}{\end{customItemList}}

%----------------------------------------------------------------------------------------
%	LANGUAGE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{languageItem}[2]{ % 2 Language level
  \setlength{\parskip}{0em}
  \MakeUppercase{\textbf{#1:}} \hspace{0.5em} #2
  \setlength{\parindent}{0.35cm}
 }{}

 \newcommand{\subLanguageItem}[3]{
\textbf{#1} (#2) - #3}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\smallskip} % The space above the horizontal line for each section 
\def\nameskip{\medskip} % The space after your name at the top
\def\sectionskip{\smallskip} % The space after the heading section
